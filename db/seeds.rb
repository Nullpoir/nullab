email = 'admin@example.com'
password = 'test-1234'

admin = Administrator.create!(
  provider: 'email',
  uid: email,
  email: email,
  password: password,
  password_confirmation: password,
  name: email,
  allow_password_change: true,
  confirmed_at: Time.zone.now
)

Post.create!(
  title: 'タイトル',
  content: '<h1>コンテンツ</h1>',
  status: :published,
  published_at: time.now,
  author_id: admin.id
)
