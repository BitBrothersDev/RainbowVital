class CreateRainbowVitalSupplementLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_vital_supplement_logs do |t|
      t.references :rainbow_vital_supplement_plan_item, null: false, foreign_key: true, index: { name: 'index_rv_sl_on_rv_spi_id' }
      t.datetime :taken_at

      t.timestamps
    end
  end
end
