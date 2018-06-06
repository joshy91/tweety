FactoryBot.define do
  factory :user do
  	name {FFaker::Name.name}
    username {FFaker::Lorem.word}
    email {FFaker::Internet.email}
    password "password"
    password_confirmation "password"
    bio {FFaker::Lorem.sentence}
    location {FFaker::AddressUS.city}

    after(:build) do |user|
  	[:goodmorning, :goodevening].each do |tweet|
  		user.tweets << FactoryBot.build(:goodevening, user: user)
  		end	
  	end
  end
end
