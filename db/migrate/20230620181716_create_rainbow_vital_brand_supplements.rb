class CreateRainbowVitalBrandSupplements < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_vital_brand_supplements do |t|
      t.references :rainbow_vital_brand, null: false, foreign_key: true, index: { name: 'rv_bs_brand_index' }
      t.references :rainbow_vital_supplement, null: false, foreign_key: true, index: { name: 'rv_bs_supplement_index' }
      t.timestamps
    end
  end
end