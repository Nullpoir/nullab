namespace :admin do
  desc "Adminの作成"
  task :create, ['name'] => :environment do
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

    puts "Created #{resource.name} as admin"
  end
end
