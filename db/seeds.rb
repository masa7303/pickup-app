User.create!(
  name: '山田花子',
  email: 'yamada@test.com',
  password: 'password',
  password_confirmation: 'password',
  prefecture: '東京都',
  municipality: '渋谷区',
  created_at: "2020-01-01 00:00:00",
  updated_at: "2020-01-01 00:00:00"
)

User.create!(
  name: '田中一郎',
  email: 'tanaka@test.com',
  password: 'password',
  password_confirmation: 'password',
  prefecture: '富山県',
  municipality: '富山市',
  created_at: "2020-01-01 00:00:00",
  updated_at: "2020-01-01 00:00:00"
)

User.create!(
  name: '花田まり',
  email: 'hanada@test.com',
  password: 'password',
  password_confirmation: 'password',
  prefecture: '千葉県',
  municipality: 'いすみ市',
  created_at: "2020-01-01 00:00:00",
  updated_at: "2020-01-01 00:00:00"
)

User.create!(
  name: '太田雄二',
  email: 'oota@test.com',
  password: 'password',
  password_confirmation: 'password',
  prefecture: '沖縄県',
  municipality: '那覇市',
  created_at: "2020-01-01 00:00:00",
  updated_at: "2020-01-01 00:00:00"
)

User.create!(
  name: '石原恵梨',
  email: 'ishihara@test.com',
  password: 'password',
  password_confirmation: 'password',
  prefecture: '青森県',
  municipality: '八戸市',
  created_at: "2020-01-01 00:00:00",
  updated_at: "2020-01-01 00:00:00"
)

User.create!(
  name: '古川大志',
  email: 'hurukawa@test.com',
  password: 'password',
  password_confirmation: 'password',
  prefecture: '北海道',
  municipality: '札幌市',
  created_at: "2020-01-01 00:00:00",
  updated_at: "2020-01-01 00:00:00"
)

User.create!(
  name: '森永歩',
  email: 'morinaga@test.com',
  password: 'password',
  password_confirmation: 'password',
  prefecture: '石川県',
  municipality: '金沢市',
  created_at: "2020-01-01 00:00:00",
  updated_at: "2020-01-01 00:00:00"
)

User.create!(
  name: '安部夏樹',
  email: 'abe@test.com',
  password: 'password',
  password_confirmation: 'password',
  prefecture: '宮城県',
  municipality: '仙台市',
  created_at: "2020-01-01 00:00:00",
  updated_at: "2020-01-01 00:00:00"
)

User.create!(
  name: '後藤拓実',
  email: 'gotou@test.com',
  password: 'password',
  password_confirmation: 'password',
  prefecture: '富山県',
  municipality: '魚津市',
  created_at: "2020-01-01 00:00:00",
  updated_at: "2020-01-01 00:00:00"
)

User.create!(
  name: '丹治郁人',
  email: 'tanji@test.com',
  password: 'password',
  password_confirmation: 'password',
  prefecture: '広島県',
  municipality: '広島市',
  created_at: "2020-01-01 00:00:00",
  updated_at: "2020-01-01 00:00:00"
)

user = User.find(1)
user.image.attach(io: File.open('app/assets/images/icon-01.jpg'), filename: 'icon-01.jpg')

user = User.find(2)
user.image.attach(io: File.open('app/assets/images/icon-02.jpg'), filename: 'icon-01.jpg')

user = User.find(3)
user.image.attach(io: File.open('app/assets/images/icon-03.jpg'), filename: 'icon-01.jpg')

user = User.find(4)
user.image.attach(io: File.open('app/assets/images/icon-04.jpg'), filename: 'icon-01.jpg')

user = User.find(5)
user.image.attach(io: File.open('app/assets/images/icon-05.jpg'), filename: 'icon-01.jpg')

user = User.find(6)
user.image.attach(io: File.open('app/assets/images/icon-01.jpg'), filename: 'icon-01.jpg')

user = User.find(7)
user.image.attach(io: File.open('app/assets/images/icon-02.jpg'), filename: 'icon-01.jpg')

user = User.find(8)
user.image.attach(io: File.open('app/assets/images/icon-03.jpg'), filename: 'icon-01.jpg')

user = User.find(9)
user.image.attach(io: File.open('app/assets/images/icon-04.jpg'), filename: 'icon-01.jpg')

user = User.find(10)
user.image.attach(io: File.open('app/assets/images/icon-05.jpg'), filename: 'icon-01.jpg')

Relationship.create!([
  {user_id: 1, follow_id: 2},
  {user_id: 1, follow_id: 3},
  {user_id: 1, follow_id: 4},
  {user_id: 1, follow_id: 5},
  {user_id: 1, follow_id: 6},
  {user_id: 1, follow_id: 7},
  {user_id: 1, follow_id: 9},
  {user_id: 2, follow_id: 1},
  {user_id: 2, follow_id: 3},
  {user_id: 2, follow_id: 4},
  {user_id: 2, follow_id: 5},
  {user_id: 2, follow_id: 6},
  {user_id: 2, follow_id: 7},
  {user_id: 2, follow_id: 8},
  {user_id: 3, follow_id: 2},
  {user_id: 3, follow_id: 5},
  {user_id: 3, follow_id: 6},
  {user_id: 3, follow_id: 8},
  {user_id: 3, follow_id: 9},
  {user_id: 4, follow_id: 1},
  {user_id: 4, follow_id: 2},
  {user_id: 4, follow_id: 3},
  {user_id: 4, follow_id: 5},
  {user_id: 4, follow_id: 6},
  {user_id: 4, follow_id: 7},
  {user_id: 4, follow_id: 8},
  {user_id: 5, follow_id: 1},
  {user_id: 5, follow_id: 2},
  {user_id: 5, follow_id: 3},
  {user_id: 5, follow_id: 4},
  {user_id: 5, follow_id: 6},
  {user_id: 5, follow_id: 7},
  {user_id: 5, follow_id: 8},
  {user_id: 6, follow_id: 1},
  {user_id: 6, follow_id: 2},
  {user_id: 6, follow_id: 3},
  {user_id: 6, follow_id: 4},
  {user_id: 6, follow_id: 8},
  {user_id: 6, follow_id: 9},
  {user_id: 7, follow_id: 1},
  {user_id: 7, follow_id: 2},
  {user_id: 7, follow_id: 3},
  {user_id: 7, follow_id: 4},
  {user_id: 7, follow_id: 5},
  {user_id: 7, follow_id: 6},
  {user_id: 7, follow_id: 9},
  {user_id: 8, follow_id: 2},
  {user_id: 8, follow_id: 3},
  {user_id: 8, follow_id: 4},
  {user_id: 9, follow_id: 5},
  {user_id: 9, follow_id: 6},
  {user_id: 9, follow_id: 7},
  {user_id: 9, follow_id: 8},
  {user_id: 10, follow_id: 2},
  {user_id: 10, follow_id: 3},
  {user_id: 10, follow_id: 4},
  {user_id: 10, follow_id: 5},
  {user_id: 10, follow_id: 6},
  {user_id: 10, follow_id: 7},
  {user_id: 10, follow_id: 9},
])
