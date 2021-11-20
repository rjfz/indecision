# frozen_string_literal: true

FactoryBot.define do
  factory :lobby_question do
    association :lobby
    association :question
    started_at { '12/2/21' }
    state { 'pending' }
  end
end
