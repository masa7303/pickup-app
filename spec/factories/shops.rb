FactoryBot.define do
  factory :shop do
    id { 1 }
    name { 'ラーメン大王' }
    prefecture { 1 }
    address { '札幌市１丁目' }
    phone { '000-000-1234' }
  end
end
