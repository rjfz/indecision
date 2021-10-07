# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    association :subject
    name { 'Artificial Intelligence' }
  end
end
