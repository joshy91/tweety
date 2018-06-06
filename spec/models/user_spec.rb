require 'rails_helper'

RSpec.describe User, type: :model do
 it 'is valid with required attributes' do
 	user = build(:user)
 	expect(user).to be_valid
 end

 it 'is invalid without a username' do
 	user.username = nil
 	expect(user).not_to be_valid
end

 it 'is invalid without an email' do
 	user.email = nil
 	expect(user).not_to be_valid
end

it 'is invalid without a password' do
 	user.password = nil
 	expect(user).not_to be_valid
end

end
