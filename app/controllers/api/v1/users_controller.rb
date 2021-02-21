class Api::V1::UsersController < ApplicationController

  def index
    users = User.order(:name).paginate(page: params[:page])
    
    json_pagination(
      users,
      UserSerializer
    )
  rescue => e
    return json_error_response(e.message, :bad_request)
  end

end
