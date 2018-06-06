FactoryBot.define do
  
  factory :goodmorning, class: Tweet do
  	association :user
    message "Good Morning"
    user_id 1
  end

  factory :goodevening, class: Tweet do
  	association :user
  	message "Good Evening"
  	user_id 1
  end
end