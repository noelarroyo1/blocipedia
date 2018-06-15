require 'random_data'
require 'faker'
include Faker


 # Create an admin user
 admin = User.create!(
   email:    'noel.arroyo1@gmail.com',
   password: 'Blochead!',
   role:     'admin'
 )

# Create a member with STANDARD membership
standard_member = User.create!(
  email:    'standard@example.com',
  password: 'Blochead1',
  role: 'standard'
)

# Create a member with PREMIUM membership
premium_member = User.create!(
  email:    'premium@example.com',
  password: 'Blochead2',
  role: 'premium'
)

# Create standard members
5.times do
  standard_members = User.create!(
    email: Faker::Internet.email,
    password: Faker::Lorem.word
  )
end

20.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(15)
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
