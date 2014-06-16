namespace :users do
  desc 'Create an admin user'
  task :admin, [:email,:password] => [:environment] do |t, args|
    User.create!(
        email: args[:email],
        password: args[:password],
        password_confirmation: args[:password],
        role: User::ADMIN
    )
  end
end
