class User < ApplicationRecord
  after_create :create_credential
  # validates :email, uniqueness: true, allow_blank: false

  private

  def create_credential
    Credential.create(description: "created by system")
  end
end
