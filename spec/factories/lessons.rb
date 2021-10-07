# frozen_string_literal: true

FactoryBot.define do
  factory :lesson do
    association :course
    name { 'MyString' }
    number { 1 }
  end
end
