FactoryBot.define do
  factory :post_tag do
    association :post, strategy: :build
    association :tag, strategy: :build
  end
end
