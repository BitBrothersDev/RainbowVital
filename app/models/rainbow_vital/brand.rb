module RainbowVital
  class Brand < ApplicationRecord
    has_many :brand_supplements, :class_name => 'RainbowVital::BrandSupplement', foreign_key: 'rainbow_vital_brand_id'
  end
end
