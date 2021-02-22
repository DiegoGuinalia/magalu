require 'rails_helper'

RSpec.describe FavoriteProduct, type: :model do
  it { expect(described_class.ancestors).to include ApplicationRecord }

  describe 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:favorite_list) }
  end
end
