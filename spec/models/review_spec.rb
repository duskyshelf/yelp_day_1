require 'rails_helper'

describe Review, type: :model do
  it {is_expected.to belong_to :restaurant }

  context 'restaurant deletion' do
    scenario 'gets deleted when restaurant is deleted' do
      kfc = Restaurant.create name: 'KFC'
      review = kfc.reviews.create(thoughts: 'meh', rating: '3')
      kfc.destroy
      expect(Review.find_by(thoughts: 'meh')).to eq nil

    end
  end
end
