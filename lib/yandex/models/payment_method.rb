module Killbill #:nodoc:
  module Yandex #:nodoc:
    class YandexPaymentMethod < ::Killbill::Plugin::ActiveMerchant::ActiveRecord::PaymentMethod

      self.table_name = 'yandex_payment_methods'

      def external_payment_method_id
        yandex_token
      end
    end
  end
end
