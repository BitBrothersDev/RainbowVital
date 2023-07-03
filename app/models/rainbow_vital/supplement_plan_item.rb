module RainbowVital
  class SupplementPlanItem < ApplicationRecord
    belongs_to :supplement_plan, class_name: 'RainbowVital::SupplementPlan', foreign_key: 'rainbow_vital_supplement_plan_id', optional: true
    belongs_to :supplement, class_name: 'RainbowVital::Supplement', foreign_key: 'rainbow_vital_supplement_id'
    has_many :supplement_logs, class_name: 'RainbowVital::SupplementLog', foreign_key: 'rainbow_vital_supplement_plan_item_id'

    validates :dosage, presence: true
    validates :frequency, presence: true, numericality: { only_integer: true, greater_than: 0 }

    serialize :times, Array

    def schedule
      schedule = IceCube::Schedule.new(start_time: Time.now)
      times.each do |time|
        hour, minute = time.split(':').map(&:to_i)
        schedule.add_recurrence_rule(IceCube::Rule.daily(frequency).hour_of_day(hour).minute_of_hour(minute))
      end
      schedule
    end

    def occurs_on?(date)
      times_to_check = times.flatten

      times_to_check.any? do |time|
        next unless time.is_a?(String)

        hour, minute = time.split(':').map(&:to_i)
        scheduled_time = date.to_time.change(hour: hour, min: minute)
        days_since_start = (scheduled_time.to_date - created_at.to_date).to_i
        days_since_start % frequency == 0
      end
    end
  end
end
