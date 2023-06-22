module RainbowVital
  class BrandSupplementVitamin < ApplicationRecord
    belongs_to :brand_supplement, class_name: 'RainbowVital::BrandSupplement', foreign_key: 'rainbow_vital_brand_supplement_id'
    belongs_to :vitamin, class_name: 'RainbowVital::Vitamin', foreign_key: 'rainbow_vital_vitamin_id'
    belongs_to :unit, class_name: 'RainbowVital::Unit', foreign_key: 'rainbow_vital_unit_id'

    def name
      [brand_supplement.name].join(' ')
    end
  end
end
