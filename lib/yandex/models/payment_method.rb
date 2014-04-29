module Killbill #:nodoc:
  module Yandex #:nodoc:
    class YandexPaymentMethod < ::Killbill::Plugin::ActiveMerchant::ActiveRecord::PaymentMethod

      self.table_name = 'yandex_payment_methods'

      def self.from_response(kb_account_id, kb_payment_method_id, kb_tenant_id, cc_or_token, response, options, extra_params = {})
        super(kb_account_id,
              kb_payment_method_id,
              kb_tenant_id,
              cc_or_token,
              response,
              options,
              {
                  # Pass custom key/values here
                  #:params_id => extract(response, 'id'),
                  #:params_card_id => extract(response, 'card', 'id')
              }.merge!(extra_params),
              ::Killbill::Yandex::YandexPaymentMethod)
      end
    end
  end
end
