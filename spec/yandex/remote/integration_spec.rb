require 'spec_helper'

ActiveMerchant::Billing::Base.mode = :test

describe Killbill::Yandex::PaymentPlugin do

  include ::Killbill::Plugin::ActiveMerchant::RSpec

  before(:each) do
    @plugin = Killbill::Yandex::PaymentPlugin.new

    @account_api    = ::Killbill::Plugin::ActiveMerchant::RSpec::FakeJavaUserAccountApi.new
    svcs            = {:account_user_api => @account_api}
    @plugin.kb_apis = Killbill::Plugin::KillbillApi.new('yandex', svcs)

    @plugin.logger       = Logger.new(STDOUT)
    @plugin.logger.level = Logger::INFO
    @plugin.conf_dir     = File.expand_path(File.dirname(__FILE__) + '../../../../')
    @plugin.start_plugin
  end

  after(:each) do
    @plugin.stop_plugin
  end

  it 'should be able to create and retrieve payment methods' do
  end

  it 'should be able to charge and refund' do
  end
end
