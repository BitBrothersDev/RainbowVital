class AddUnitIdToBrandSupplementVitamins < ActiveRecord::Migration[7.0]
  def change
    add_reference :rainbow_vital_brand_supplement_vitamins, :rainbow_vital_unit, foreign_key: true, index: { name: 'index_rc_bs_vitamins_on_unit_id' }
  end
end
