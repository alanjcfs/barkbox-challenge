FactoryBot.define do
  factory :like do
    association user
    association dog
  end
end
