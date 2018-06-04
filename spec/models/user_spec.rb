require 'rails_helper'

RSpec.describe User, type: :model do
 it 'is valid with required attributes' do
 	user = User.new(email: 'jojo@mojo.com', password: 'dsfjdslkfjaslfj', name: 'Mojo Jojo', username: "mojoJojo", bio: "crazy evil genius monkey", location: "Townsville")
 	expect(user).to be_valid
 end

 it 'is invalid without a username' do
 	user = User.new(email: 'jojo@mojo.com', password: 'dsfjdslkfjaslfj', name: 'Mojo Jojo', username: nil, bio: "crazy evil genius monkey", location: "Townsville")
 	expect(user).not_to be_valid
end

 it 'is invalid without an email' do
 	user = User.new(email: nil, password: 'dsfjdslkfjaslfj', name: 'Mojo Jojo', username: "jdlsfjasl;j", bio: "crazy evil genius monkey", location: "Townsville")
 	expect(user).not_to be_valid
end

it 'is invalid without a password' do
 	user = User.new(email: 'jojo@mojo.com', password: nil, name: 'Mojo Jojo', username: "mojoJojo", bio: "crazy evil genius monkey", location: "Townsville")
 	expect(user).not_to be_valid
end

end
