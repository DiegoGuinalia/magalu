class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    users = User.order(:name).paginate(page: params[:page])
    
    json_pagination(
      users,
      UserSerializer
    )
  rescue => e
    return json_error_response(e.message, :bad_request)
  end

  def create
    result = Users::Create.new(user_params).call
    
    response_handler(result)
  end

  def show
    json_success_response(UserSerializer.new(@user))
  end

  def update
    result = Users::Update.new(@user, user_params).call

    response_handler(result)
  end

  def destroy
    if @user.id == @current_user.id
      return render json: { message: 'current user could not be deleted'}, status: 405
    end

    @user.destroy
    head 204
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def response_handler(result)
    return json_error_response(result.errors[:error_message], :bad_request) if result.failure?

    json_success_response(result.data[:user])
  end

  def user_params
    params.permit(:name, :email)
  end

end
