class User < ApplicationRecord
  after_create :create_credential
  validates :email, uniqueness: true, :presence => true, allow_blank: false
  validates :name, :presence => true, allow_blank: false

  has_one :credential, :dependent => :destroy
  has_one :favorite_list, :dependent => :destroy

  private

  def create_credential
    Credential.create(description: "created by system", user: self)
  end
end
