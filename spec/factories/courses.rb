FactoryBot.define do
  factory :course do
    association :subject
    name { 'Artificial Intelligence' }
  end
end
