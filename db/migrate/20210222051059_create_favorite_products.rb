class CreateFavoriteProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_products do |t|
      t.integer :product_id
      t.integer :favorite_list_id

      t.timestamps
    end
  end
end
