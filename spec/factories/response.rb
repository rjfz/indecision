FactoryBot.define do
  factory :response do
    association :answer
    association :lobby_question
    association :anon_user
  end
end
