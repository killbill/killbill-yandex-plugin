require 'action_controller'
require 'active_record'
require 'action_view'
require 'active_merchant'
require 'active_support'
require 'bigdecimal'
require 'money'
require 'pathname'
require 'sinatra'
require 'singleton'
require 'yaml'

require 'killbill'
require 'killbill/helpers/active_merchant'

require 'yandex/api'
require 'yandex/private_api'

require 'yandex/models/payment_method'
require 'yandex/models/response'
require 'yandex/models/transaction'

class Object
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end
end
