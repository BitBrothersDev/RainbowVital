module RainbowVital
  class SupplementVitamin < ApplicationRecord
    belongs_to :supplement, class_name: 'RainbowVital::Supplement', foreign_key: 'rainbow_vital_supplement_id'
    belongs_to :vitamin, class_name: 'RainbowVital::Vitamin', foreign_key: 'rainbow_vital_vitamin_id'
    belongs_to :unit, class_name: 'RainbowVital::Unit', foreign_key: 'rainbow_vital_unit_id'

    def name
      [supplement.name].join(' ')
    end
  end
end
