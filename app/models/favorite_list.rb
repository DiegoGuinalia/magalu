class FavoriteList < ApplicationRecord
  belongs_to :user
  has_many :favorite_products, :dependent => :destroy

  validates :user_id, uniqueness: {scope: :user_id}
end
