class CreateRainbowVitalSupplementVitamins < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_vital_supplement_vitamins do |t|
      t.references :rainbow_vital_supplement, null: false, foreign_key: true, index: { name: 'rv_sv_supplement_index' }
      t.references :rainbow_vital_vitamin, null: false, foreign_key: true, index: { name: 'rv_sv_vitamin_index' }
      t.string :dosage
      t.timestamps
    end
  end
end
