# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    association :role
    association :anon_user
    email { 'test@test.com' }
    password { '123456' }
  end
end
