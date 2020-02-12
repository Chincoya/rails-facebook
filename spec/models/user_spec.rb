# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
    expect(user).to be_valid
  end
  it 'is not valid without email/password' do
    user = User.new(name: Faker::Name.name, password: 'foobar')
    expect(user).to_not be_valid
    user = User.new(name: Faker::Name.name, email: Faker::Internet.email)
    expect(user).to_not be_valid
  end
end
