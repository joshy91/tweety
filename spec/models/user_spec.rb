require "rails_helper"

RSpec.describe User, type: :model do
	let(:user) { build(:user) }

	it 'has a valid factory' do
		expect(build(:user)).to be_valid
	end

  it 'is valid with required attributes' do
  	#user = User.new(email: 'jojo@mojo.com', password: 'xnsaadlahdh98lkjad', name: 'Mojo Jojo', username: 'mojojojo', bio: 'crazy evil genius monkey', location: 'Townsville')
  	expect(user).to be_valid
  end

  it 'is invalid without a username' do
  	user.username = nil
  	#user = User.new(email: 'jojo@mojo.com', password: 'xnsaadlahdh98lkjad', name: 'Mojo Jojo', username: nil, bio: 'crazy evil genius monkey', location: 'Townsville')
		expect(user).not_to be_valid
	end

	it 'is invalid without an email' do
  	user.email = nil
  	#user = User.new(email: nil, password: 'xnsaadlahdh98lkjad', name: 'Mojo Jojo', username: 'mojojojo', bio: 'crazy evil genius monkey', location: 'Townsville')
		expect(user).not_to be_valid
	end

	it 'is invalid without a password' do
		user.password = nil
		#user = User.new(email: 'jojo@jojo.com', password: nil, name: 'Mojo Jojo', username: 'mojojojo', bio: 'crazy evil genius monkey', location: 'Townsville')
		expect(user).not_to be_valid
	end

	it 'has two tweets' do
		expect(user.tweets.length).to eq(2)
	end

	it 'belongs to User' do
		expect(Tweet.reflect_on_association(:user).macro).to eq(:belongs_to)
	end

end