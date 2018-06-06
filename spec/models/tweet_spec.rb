require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it 'has a valid factory' do
  	expect(FactoryBot.build(:goodmorning)).to be_valid
  end

  it 'has a valid factory' do
  	tweet = create(:goodmorning)
  	expect(tweet).to be_valid
  end

	it 'has a valid factory' do
	tweet = build(:goodmorning, message: nil)
  	expect(tweet).not_to be_valid
  end

end