module Killbill #:nodoc:
  module Yandex #:nodoc:
    class PaymentPlugin < ::Killbill::Plugin::ActiveMerchant::PaymentPlugin

      def initialize
        gateway_builder = Proc.new do |config|
          # Change this if needed
          ::ActiveMerchant::Billing::YandexGateway.new :login => config[:login]
        end

        super(gateway_builder,
              :yandex,
              Killbill::Yandex::YandexPaymentMethod,
              Killbill::Yandex::YandexTransaction,
              Killbill::Yandex::YandexResponse)
      end

      def process_payment(kb_account_id, kb_payment_id, kb_payment_method_id, amount, currency, context)
        # TODO
      end

      def get_payment_info(kb_account_id, kb_payment_id, context)
        super
      end

      def search_payments(search_key, offset, limit, context)
        super
      end

      def process_refund(kb_account_id, kb_payment_id, refund_amount, currency, context)
        # TODO
      end

      def get_refund_info(kb_account_id, kb_payment_id, context)
        super
      end

      def search_refunds(search_key, offset, limit, context)
        super
      end

      def add_payment_method(kb_account_id, kb_payment_method_id, payment_method_props, set_default, context)
        # TODO
      end

      def delete_payment_method(kb_account_id, kb_payment_method_id, context)
        super
      end

      def get_payment_method_detail(kb_account_id, kb_payment_method_id, context)
        super
      end

      def set_default_payment_method(kb_account_id, kb_payment_method_id, context)
        # TODO
      end

      def get_payment_methods(kb_account_id, refresh_from_gateway, context)
        super
      end

      def search_payment_methods(search_key, offset, limit, context)
        super
      end

      def reset_payment_methods(kb_account_id, payment_methods)
        super
      end
    end
  end
end
