class CreateRainbowVitalSupplementPlanItems < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_vital_supplement_plan_items do |t|
      t.references :rainbow_vital_supplement_plan, null: false, foreign_key: true, index: { name: 'index_rv_spi_on_rv_sp_id' }
      t.references :rainbow_vital_supplement, null: false, foreign_key: true, index: { name: 'index_rv_spi_on_rv_s_id' }
      t.integer :dosage
      t.references :rainbow_vital_unit, null: false, foreign_key: true, index: { name: 'index_rv_spi_on_rv_u_id' }
      t.integer :frequency
      t.timestamps
    end
  end
end