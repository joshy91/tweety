require 'rails_helper'

RSpec.describe User, type: :model do
 it 'is valid with required attributes' do
 	user = User.new(email: 'jojo@mojo.com', password: 'dsfjdslkfjaslfj', name: 'Mojo Jojo', username: "mojoJojo", bio: "crazy evil genius monkey", location: "Townsville")
 	expect(user).to be_valid
 end
end
