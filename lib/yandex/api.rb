module Killbill #:nodoc:
  module Yandex #:nodoc:
    class PaymentPlugin < ::Killbill::Plugin::ActiveMerchant::PaymentPlugin

      def initialize
        gateway_builder = Proc.new do |config|
          # Not supported
          nil
        end

        super(gateway_builder,
              :yandex,
              ::Killbill::Yandex::YandexPaymentMethod,
              ::Killbill::Yandex::YandexTransaction,
              ::Killbill::Yandex::YandexResponse)
      end

      def authorize_payment(kb_account_id, kb_payment_id, kb_payment_method_id, amount, currency, context)
        # Pass extra parameters for the gateway here
        options = {}
        super(kb_account_id, kb_payment_id, kb_payment_method_id, amount, currency, context, options)
      end

      def capture_payment(kb_account_id, kb_payment_id, kb_payment_method_id, amount, currency, context)
        # Pass extra parameters for the gateway here
        options = {}
        super(kb_account_id, kb_payment_id, kb_payment_method_id, amount, currency, context, options)
      end

      def void_payment(kb_account_id, kb_payment_id, kb_payment_method_id, context)
        # Pass extra parameters for the gateway here
        options = {}
        super(kb_account_id, kb_payment_id, kb_payment_method_id, context, options)
      end

      def process_payment(kb_account_id, kb_payment_id, kb_payment_method_id, amount, currency, context)
        # Pass extra parameters for the gateway here
        options = {}
        super(kb_account_id, kb_payment_id, kb_payment_method_id, amount, currency, context, options)
      end

      def get_payment_info(kb_account_id, kb_payment_id, context)
        super
      end

      def search_payments(search_key, offset, limit, context)
        super
      end

      def process_refund(kb_account_id, kb_payment_id, refund_amount, currency, context)
        # Pass extra parameters for the gateway here
        options = {}
        super(kb_account_id, kb_payment_id, refund_amount, currency, context, options)
      end

      def get_refund_info(kb_account_id, kb_payment_id, context)
        super
      end

      def search_refunds(search_key, offset, limit, context)
        super
      end

      def add_payment_method(kb_account_id, kb_payment_method_id, payment_method_props, set_default, context)
        # Pass extra parameters for the gateway here
        options = {}
        super(kb_account_id, kb_payment_method_id, payment_method_props, set_default, context, options)
      end

      def delete_payment_method(kb_account_id, kb_payment_method_id, context)
        # Pass extra parameters for the gateway here
        options = {}
        super(kb_account_id, kb_payment_method_id, context, options)
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

      def build_form_descriptor(kb_account_id, descriptor_fields, context)
        super
      end

      def process_notification(notification, context)
        super
      end
    end
  end
end
