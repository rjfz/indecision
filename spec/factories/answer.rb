# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    association :question
    value { 'value' }
    correct { 'true' }
  end
end
