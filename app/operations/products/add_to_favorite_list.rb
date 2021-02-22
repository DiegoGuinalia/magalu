module Products
  class AddToFavoriteList
    require_relative '../result'
    attr_accessor :result, :favorite_product

    def initialize(user, params)
      @user = user
      @params = params
    end
    
    def call
      @result ||= Result.new
      add_to_favorites
    rescue => e
      result.add_error(error_class: e.class, error_message: e.message)
      result
    end

    private

    def add_to_favorites
      product = Product.find_or_create_by(@params)

      favorite_list = FavoriteList.find_or_create_by(user_id: @user.id)

      favorite_product = FavoriteProduct.create!(
        product_id: product.id,
        favorite_list_id: favorite_list.id
      )

      result.assign(:user, FavoriteListSerializer.new(favorite_list.reload))
      result
    end

  end
end