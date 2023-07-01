module RainbowVital
  module UserExtension
    extend ActiveSupport::Concern

    included do
      has_many :supplement_plans, :class_name => 'RainbowVital::SupplementPlan', foreign_key: :user_id
    end
  end
end