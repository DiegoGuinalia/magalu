module Products
  class RemoveFromFavList
    require_relative '../result'
    attr_accessor :result, :favorite_product

    def initialize(user, params)
      @user = user
      @params = params
    end
    
    def call
      @result ||= Result.new
      remove_from_favorites
    rescue => e
      result.add_error(error_class: e.class, error_message: e.message)
      result
    end

    private

    def remove_from_favorites
      favorite_list = FavoriteList.find_by(user_id: @user.id)

      raise(ActiveRecord::RecordNotFound, "Favorite list doesn't exists")  unless favorite_list

      remove_favorite_product(favorite_list)
      result.assign(:user, FavoriteListSerializer.new(favorite_list.reload))
      result
    end

    def remove_favorite_product(favorite_list)
      favorite_product = FavoriteProduct.find_by(
        product_id: @params[:product_id],
        favorite_list_id: favorite_list.id
      )
      
      raise(ActiveRecord::RecordNotFound, "Product not found") unless favorite_product
      favorite_product.destroy
    end

  end
end