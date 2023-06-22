class AddRainbowVitalUnitsToRainbowVitalBrandSupplements < ActiveRecord::Migration[7.0]
  def change
    add_reference :rainbow_vital_brand_supplements, :rainbow_vital_unit, foreign_key: true, index: { name: 'index_supplements_on_unit_id' }
  end
end
