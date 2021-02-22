class Product < ApplicationRecord
  validates :external_id, uniqueness: true
end
