class CreateRainbowVitalVitamins < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_vital_vitamins do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
