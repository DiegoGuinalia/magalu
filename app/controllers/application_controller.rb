class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include API::ResponseConcerns

  before_action :authenticate

  protected

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |api_key, _options|
      Credential.find_by(api_key: api_key)
    end
  end

  def render_unauthorized(realm = 'Application')
    headers['WWW-Authenticate'] = %(Token realm="#{realm.delete('"')}")
    render json: { error: :bad_credentials }.to_json, status: :unauthorized
  end
end