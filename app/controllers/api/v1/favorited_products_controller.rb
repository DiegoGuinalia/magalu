class Api::V1::FavoritedProductsController < ApplicationController
  before_action :set_favorite_list, only: %i[show destroy]

  def add_to_fav_list
    result = Products::AddToFavoriteList.new(@current_user, product_params).call

    response_handler(result)
  end

  def remove_product
    result = Products::RemoveFromFavList.new(@current_user, product_params).call

    response_handler(result)
  end

  def show
    json_success_response(FavoriteListSerializer.new(@favorite_list))
  end

  def destroy
    @favorite_list.destroy
    head 204
  end

  private

  def set_favorite_list
    @favorite_list = FavoriteList.find(params[:id])
  end

  def response_handler(result)
    return json_error_response(result.errors[:error_message], :bad_request) if result.failure?

    json_success_response(result.data[:user])
  end

  def product_params
    params.permit(:name, :brand, :image, :external_id, :title, :price, :product_id)
  end

end
