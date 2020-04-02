FactoryBot.define do
  factory :comment do
    body { '待ち時間をHPで随時発信しています。' }
    association :user
    association :task
  end
end
