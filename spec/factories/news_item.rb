FactoryBot.define do
  factory :news_item do
    title "Test"
    description "Test description"
    expire_at Time.now + 1.day
  end
end