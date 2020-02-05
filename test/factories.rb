# frozen_string_literal: true

FactoryBot.define do
  factory :friendship do
    user_id { 1 }
    friend_id { 1 }
    confirm { false }
  end

  factory :comment do
    content { 'MyText' }
    user_id { 1 }
    post_id { 1 }
  end

  factory :like do
    user_id { 1 }
    likeable_id { 1 }
    likeable_type { 'MyString' }
  end

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
  end

  factory :post do
    content { Faker::String.random(length: 25) }
    user_id { nil }
  end
end
