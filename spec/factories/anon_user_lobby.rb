FactoryBot.define do
  factory :anon_user_lobby do
    association :anon_user
    association :lobby
end
end
