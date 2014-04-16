module Killbill #:nodoc:
  module Yandex #:nodoc:
    class YandexTransaction < Killbill::Plugin::ActiveMerchant::ActiveRecord::Transaction

      self.table_name = 'yandex_transactions'

    end
  end
end
