module RainbowVital
  class SupplementPlan < ApplicationRecord
    belongs_to :user
    has_many :supplement_plan_items, class_name: 'RainbowVital::SupplementPlanItem',
             foreign_key: 'rainbow_vital_supplement_plan_id'
    accepts_nested_attributes_for :supplement_plan_items, allow_destroy: true

    def supplement_due?(supplement_plan_item)
      last_log = supplement_plan_item.supplement_logs.order(taken_at: :desc).first
      return true if last_log.nil?

      supplement_plan_item.schedule.occurs_between?(last_log.taken_at, Time.now)
    end
  end
end
