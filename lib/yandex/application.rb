# -- encoding : utf-8 --

configure do
  # Usage: rackup -Ilib -E test
  if development? or test?
    # Make sure the plugin is initialized
    plugin = ::Killbill::Yandex::PaymentPlugin.new
    plugin.logger = Logger.new(STDOUT)
    plugin.logger.level = Logger::INFO
    plugin.conf_dir = File.dirname(File.dirname(__FILE__)) + '/..'
    plugin.start_plugin
  end
end

helpers do
  def plugin
    ::Killbill::Yandex::PrivatePaymentPlugin.instance
  end

  def required_parameter!(parameter_name, parameter_value, message='must be specified!')
    halt 400, "#{parameter_name} #{message}" if parameter_value.blank?
  end
end

after do
  # return DB connections to the Pool if required
  ::ActiveRecord::Base.connection.close
end

# curl -v http://127.0.0.1:9292/plugins/killbill-yandex/1.0/pms/1
get '/plugins/killbill-yandex/1.0/pms/:id', :provides => 'json' do
  if pm = ::Killbill::Yandex::YandexPaymentMethod.find_by_id(params[:id].to_i)
    pm.to_json
  else
    status 404
  end
end

# curl -v http://127.0.0.1:9292/plugins/killbill-yandex/1.0/transactions/1
get '/plugins/killbill-yandex/1.0/transactions/:id', :provides => 'json' do
  if transaction = ::Killbill::Yandex::YandexTransaction.find_by_id(params[:id].to_i)
    transaction.to_json
  else
    status 404
  end
end

# curl -v http://127.0.0.1:9292/plugins/killbill-yandex/1.0/responses/1
get '/plugins/killbill-yandex/1.0/responses/:id', :provides => 'json' do
  if transaction = ::Killbill::Yandex::YandexResponse.find_by_id(params[:id].to_i)
    transaction.to_json
  else
    status 404
  end
end