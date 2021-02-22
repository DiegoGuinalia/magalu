class FavoriteListSerializer < ActiveModel::Serializer
  attributes :products

  def products
    object.favorite_products.map(&:product).compact
  end
end
