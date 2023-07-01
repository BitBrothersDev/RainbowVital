class CreateRainbowVitalSupplementPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_vital_supplement_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
