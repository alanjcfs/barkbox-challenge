FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "email#{n}@example.com"
    end
    password 'foobar'
  end
end
