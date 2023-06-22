module RainbowVital
  class Supplement < ApplicationRecord
    has_many :brand_supplements, :class_name => 'RainbowVital::BrandSupplement', foreign_key: 'rainbow_vital_supplement_id'
    has_many :brand_supplement_vitamins, through: :brand_supplements, :class_name => 'RainbowVital::BrandSupplementVitamin'
    has_many :vitamins, through: :brand_supplement_vitamins, :class_name => 'RainbowVital::Vitamin'
  end
end
