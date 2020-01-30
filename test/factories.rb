FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email  { Faker::Internet.email }
    password { 'password' }
  end

  factory :post do
    content { Faker::String.random(length: 25) }
    user_id { nil }
  end
end