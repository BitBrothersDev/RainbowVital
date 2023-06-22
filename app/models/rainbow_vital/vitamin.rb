module RainbowVital
  class Vitamin < ApplicationRecord
    has_many :brand_supplement_vitamins, :class_name => 'RainbowVital::BrandSupplementVitamin', :foreign_key => 'rainbow_vital_vitamin_id'
  end
end
