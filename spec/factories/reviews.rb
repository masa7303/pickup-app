FactoryBot.define do
  factory :review do
    id { 1 }
    user_id { 1 }
    shop_id { 1 }
    title { '絶品ラーメン' }
    body { '美味しかったです。' }
    rate { 5 }
  end
end
