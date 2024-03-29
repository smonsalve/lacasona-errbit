puts "Seeding database"
puts "-------------------------------"

# Create an initial Admin User
admin_username = "errbit"
admin_email = "errbit@#{Errbit::Config.host}"
admin_pass  = 'password'

puts "Creating an initial admin user:"
puts "-- username: #{admin_username}" if Errbit::Config.user_has_username
puts "-- email:    #{admin_email}"
puts "-- password: #{admin_pass}"
puts ""
puts "Be sure to change these credentials ASAP!"
user = User.where(:email => admin_email).first || User.new({
  :name                   => 'Errbit Admin',
  :email                  => 'josevasmon@gmail.com',
  :password               => 'vasmonjose',
  :password_confirmation  => 'vasmonjose'
})
user.username = admin_username if Errbit::Config.user_has_username

user.admin = true
user.save!

