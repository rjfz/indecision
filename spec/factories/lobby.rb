# frozen_string_literal: true

FactoryBot.define do
  factory :lobby do
    association :lesson
    association :year
    name { 'MyString' }
    room_code { 'CS1011' }
    session_date { '12/2/21' }
    state { 'pending' }
  end
end
