class Credential < ApplicationRecord

  before_create :initialize_api_key

  belongs_to :user

  private
  def initialize_api_key
    self.api_key ||= generate_api_key
  end

  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless Credential.exists?(api_key: token)
    end
  end

end