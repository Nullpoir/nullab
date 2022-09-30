FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "タイトル#{n}" }
    sequence(:content) { |n| "コンテンツ#{n}" }
  end
end
