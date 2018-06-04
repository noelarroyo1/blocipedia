require 'random_data'

10.times do
  Wiki.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
wikis = Wiki.all


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

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
