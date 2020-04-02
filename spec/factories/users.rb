FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "テスト#{n}ユーザー" }
    sequence(:email) {|n| "servant#{n}@example.com"}
    password {"servant"}
    password_confirmation {"servant"}
    prefecture { "東京都" }
    municipality { "渋谷区" }
  end
end
