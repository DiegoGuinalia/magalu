class FavoriteProduct < ApplicationRecord
  belongs_to :product
  belongs_to :favorite_list

  validates :product_id, uniqueness: {scope: :product_id}
end
