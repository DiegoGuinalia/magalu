require 'rails_helper'

RSpec.describe FavoriteList, type: :model do
  it { expect(described_class.ancestors).to include ApplicationRecord }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:favorite_products) }
  end
end
