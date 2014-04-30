require 'spec_helper'

describe Killbill::Yandex::PaymentPlugin do
  before(:each) do
    Dir.mktmpdir do |dir|
      file = File.new(File.join(dir, 'yandex.yml'), "w+")
      file.write(<<-eos)
:yandex:
  :test: true
  :scid: '9999'
# As defined by spec_helper.rb
:database:
  :adapter: 'sqlite3'
  :database: 'test.db'
      eos
      file.close

      @plugin              = Killbill::Yandex::PaymentPlugin.new
      @plugin.logger       = Logger.new(STDOUT)
      @plugin.logger.level = Logger::INFO
      @plugin.conf_dir     = File.dirname(file)
      @plugin.kb_apis      = Killbill::Plugin::KillbillApi.new('yandex', {})

      # Start the plugin here - since the config file will be deleted
      @plugin.start_plugin
    end
  end

  it 'should start and stop correctly' do
    @plugin.stop_plugin
  end

  it 'should generate forms correctly' do
    kb_account_id = SecureRandom.uuid
    kb_tenant_id  = SecureRandom.uuid
    context       = @plugin.kb_apis.create_context(kb_tenant_id)
    fields        = @plugin.hash_to_properties({
                                                   :order_id => '1234',
                                                   :amount   => 10
                                               })
    form          = @plugin.build_form_descriptor kb_account_id, fields, [], context

    form.kb_account_id.should == kb_account_id
    form.form_method.should == 'POST'
    form.form_url.should == 'https://money.yandex.ru/eshop.xml'

    form_fields = @plugin.properties_to_hash(form.form_fields)
    form_fields.size.should == 3
    form_fields[:orderNumber].should == '1234'
    form_fields[:Sum].should == '10'
    form_fields[:scid].should == '9999'
  end

  it 'should receive notifications correctly' do
    secret = 'secret'
    account_id = '123'
    invoice_id = '0909'
    datetime = Time.now
    datetime_str = datetime.strftime("%Y-%m-%dT%H:%M:%S+0#{datetime.gmt_offset / 3600}:00")

    kb_tenant_id = SecureRandom.uuid
    context      = @plugin.kb_apis.create_context(kb_tenant_id)
    properties   = @plugin.hash_to_properties({
                                                  :account => account_id,
                                                  :secret => secret
                                              })

    notification    = "shopId=9384&orderNumber=09834&request_type=payment_success&orderIsPaid=1&invoiceId=#{invoice_id}&orderSumAmount=400&md5=e49ac35a5a93284597bc5adb5f348cf1"
    gw_notification = @plugin.process_notification notification, properties, context

    expected_entity = <<-eos
<?xml version="1.0" encoding="windows-1251"?>
<response performedDatetime="#{datetime_str}">
  <result code="0" action="PaymentSuccess" shopId="#{account_id}" invoiceId="#{invoice_id}"  />
</response>
    eos
    gw_notification.entity.should == expected_entity.chomp
  end
end
