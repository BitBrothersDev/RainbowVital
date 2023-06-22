class CreateRainbowVitalUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_vital_units do |t|
      t.string :name

      t.timestamps
    end
  end
end
