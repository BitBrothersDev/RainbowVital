module RainbowVital
  class SupplementLog < ApplicationRecord
    belongs_to :supplement_plan_item, class_name: 'RainbowVital::SupplementPlanItem', foreign_key: 'rainbow_vital_supplement_plan_item_id'

    validates :taken_at, presence: true
  end
end
