module Killbill #:nodoc:
  module Yandex #:nodoc:
    class YandexResponse < Killbill::Plugin::ActiveMerchant::ActiveRecord::Response

      self.table_name = 'yandex_responses'

    end
  end
end
