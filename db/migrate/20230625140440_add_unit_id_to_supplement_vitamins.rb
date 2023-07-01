class AddUnitIdToSupplementVitamins < ActiveRecord::Migration[7.0]
  def change
    add_reference :rainbow_vital_supplement_vitamins, :rainbow_vital_unit, null: false, foreign_key: true, index: { name: 'rv_sv_unit_index' }
  end
end
