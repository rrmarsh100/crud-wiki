require 'faker'

10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    # standard: true,
    # admin: false,
    # premium: false
  )
  user.confirm
end
users = User.all

50.times do
  Wiki.create!(

  title: Faker::Space.galaxy,
  body: Faker::MostInterestingManInTheWorld.quote,
  private: false,
  user: users.sample
  )
end
wikis = Wiki.all


# Create an admin user
admin = User.create!(
  # name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)
admin.confirm

# Create a standard user
standard = User.create!(
  # name: 'Standard User',
  email: 'nhe6dc@gmail.com',
  password: 'helloworld',
)
standard.confirm

premium = User.create!(
  email: 'premium@example.com',
  password: 'helloworld',
  role: 'premium'
)
premium.confirm

puts "Seed finished"
puts "#{users.count} users created"
puts "#{wikis.count} wikis created"
