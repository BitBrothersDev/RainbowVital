module RainbowVital
  class Unit < ApplicationRecord
    has_many :brand_supplements, :class_name => 'RainbowVital::BrandSupplement', :foreign_key => 'rainbow_vital_unit_id'
    has_many :brand_supplement_vitamins, :class_name => 'RainbowVital::BrandSupplementVitamin', :foreign_key => 'rainbow_vital_unit_id'
  end
end
