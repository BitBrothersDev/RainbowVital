module RainbowVital
  class Supplement < ApplicationRecord
    belongs_to :brand, :class_name => 'RainbowVital::Brand', foreign_key: 'rainbow_vital_brand_id'
    has_many :supplement_vitamins, :class_name => 'RainbowVital::SupplementVitamin', foreign_key: 'rainbow_vital_supplement_id'
    has_many :vitamins, through: :supplement_vitamins, :class_name => 'RainbowVital::Vitamin'
  end
end
