FactoryBot.define do
  factory :tag do
    sequence(:name) { |n| "タイトル#{n}" }
  end
end
