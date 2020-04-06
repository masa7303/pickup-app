FactoryBot.define do
  factory :user do
    id { 1 }
    sequence(:name) { |n| "テスト#{n}ユーザー" }
    sequence(:email) {|n| "servant#{n}@example.com"}
    password {"password"}
    password_confirmation {"password"}
    prefecture { "東京都" }
    municipality { "渋谷区" }
    role { :normal }
  end

  trait :guest do
    id { 2 }
    role { :guest }
  end

  trait :admin do
    id { 3 }
    role { :admin }
    name { '管理者ユーザー' }
    email { 'admin@test.com' }
    password {'servant'}
    password_confirmation {'servant'}
  end
end
