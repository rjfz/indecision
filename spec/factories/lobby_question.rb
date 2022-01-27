# frozen_string_literal: true

FactoryBot.define do
  factory :lobby_question do
    association :lobby
    association :question
    started_at { Time.now }
    state { 'pending' }
  end
end
