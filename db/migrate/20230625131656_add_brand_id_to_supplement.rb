class AddBrandIdToSupplement < ActiveRecord::Migration[7.0]
  def change
    add_reference :rainbow_vital_supplements, :rainbow_vital_brand, null: false, foreign_key: true, index: { name: 'rv_s_brand_index' }
  end
end
