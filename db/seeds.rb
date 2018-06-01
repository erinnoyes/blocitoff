require 'faker'


10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password"
  )
end

users = User.all

20.times do
  Item.create!(
    user: users.sample,
    name: Faker::Beer.unique.name
  )
end


items = Item.all

puts "Seed finished"
puts "#{Item.count} items"
puts "#{User.count} users" 
