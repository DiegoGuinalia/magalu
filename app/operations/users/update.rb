module Users
  class Update
    require_relative '../result'
    attr_accessor :result

    def initialize(user, params)
      @user = user
      @params = params
    end
    
    def call
      @result ||= Result.new
      update_user
    rescue => e
      result.add_error(error_class: e.class, error_message: e.message)
      result
    end

    private

    def update_user
      @user.update!(@params)
      result.assign(:user, UserSerializer.new(@user))
      result
    end
  end
end