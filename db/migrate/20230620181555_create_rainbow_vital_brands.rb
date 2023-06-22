class CreateRainbowVitalBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_vital_brands do |t|
      t.string :name
      t.string :website
      t.timestamps
    end
  end
end
