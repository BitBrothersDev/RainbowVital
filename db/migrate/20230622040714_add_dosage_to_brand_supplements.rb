class AddDosageToBrandSupplements < ActiveRecord::Migration[7.0]
  def change
    add_column :rainbow_vital_brand_supplements, :dosage, :string
  end
end
