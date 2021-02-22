module Users
  class Create
    require_relative '../result'
    attr_accessor :result

    def initialize(user_params)
      @params = user_params
    end
    
    def call
      @result ||= Result.new
      create_user
    rescue => e
      result.add_error(error_class: e.class, error_message: e.message)
      result
    end

    private

    def create_user
      user = User.create(@params)
      result.assign(:user, UserSerializer.new(user))
      result
    end

    
  end
end