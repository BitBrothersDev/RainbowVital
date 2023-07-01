module RainbowVital
  class Brand < ApplicationRecord
    has_many :supplements, :class_name => 'RainbowVital::Supplement', foreign_key: 'rainbow_vital_brand_id'
  end
end
