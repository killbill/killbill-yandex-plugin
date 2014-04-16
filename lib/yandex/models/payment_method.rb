module Killbill #:nodoc:
  module Yandex #:nodoc:
    class YandexPaymentMethod < Killbill::Plugin::ActiveMerchant::ActiveRecord::PaymentMethod

      self.table_name = 'yandex_payment_methods'

    end
  end
end
