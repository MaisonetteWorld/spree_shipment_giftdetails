module Spree
  class Giftwrap < ActiveRecord::Base
    include Spree::CalculatedAdjustments
    include Spree::AdjustmentSource

    TOTAL_LABEL = Spree.t('giftwrap.total_label')

    def amount(currency = 'USD')
      Spree::Money.new(price, currency: currency)
    end

    def compute_amount(order)
      price
    end

    def label(currency = 'USD')
      "#{title} (#{amount(currency)})"
    end
  end
end
