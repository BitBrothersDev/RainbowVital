module RainbowVital
  class Vitamin < ApplicationRecord
    has_many :supplement_vitamins, :class_name => 'RainbowVital::SupplementVitamin', :foreign_key => 'rainbow_vital_vitamin_id'
  end
end
