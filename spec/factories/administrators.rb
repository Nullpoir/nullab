FactoryBot.define do
  factory :administrator do
    sequence(:email) { |n| "test#{n}@example.com"}
    password { "test-1234" }
    password_confirmation { "test-1234" }
  end
end
