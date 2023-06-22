module RainbowVital
  class BrandSupplement < ApplicationRecord
    belongs_to :brand, class_name: 'RainbowVital::Brand', foreign_key: 'rainbow_vital_brand_id'
    belongs_to :supplement, class_name: 'RainbowVital::Supplement', foreign_key: 'rainbow_vital_supplement_id'
    belongs_to :unit, class_name: 'RainbowVital::Unit', foreign_key: 'rainbow_vital_unit_id'

    has_many :brand_supplement_vitamins, class_name: 'RainbowVital::BrandSupplementVitamin', foreign_key: 'rainbow_vital_brand_supplement_id'
    def name
      [brand.name, supplement.name].join(' ')
    end
  end
end
