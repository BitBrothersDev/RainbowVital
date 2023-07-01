class AddTimesToSupplementPlanItems < ActiveRecord::Migration[7.0]
  def change
    add_column :rainbow_vital_supplement_plan_items, :times, :text
  end
end
