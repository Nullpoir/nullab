email = 'admin@example.com'
password = 'test-1234'

resource = Administrator.new(
            provider: 'email',
            uid: email,
            email: email,
            password: password,
            password_confirmation: password,
            name: email,
            allow_password_change: true,
            confirmed_at: Time.zone.now
          )
resource.save!
