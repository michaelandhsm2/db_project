# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
r = Random.new

25.times do |n|
  store = Store.new
  store.name  = Faker::Company.unique.name
  store.address = Faker::GameOfThrones.city + Faker::Address.street_address + Faker::Address.secondary_address
  store.email = Faker::Internet.email
  store.phone = "0" + Faker::PhoneNumber.subscriber_number(4) + Faker::PhoneNumber.subscriber_number(4) + Faker::PhoneNumber.subscriber_number(1)
  store.description = Faker::Hacker.say_something_smart
  store.remote_image_url = Faker::Company.logo
  store.save!
end

250.times do |n|
  item = Item.new
  item.name = Faker::Food.unique.ingredient
  item.store = Store.find(r.rand(1..25))
  item.quantity = r.rand(0..25)
  item.price = r.rand(10..1000)
  item.description = Faker::Hacker.say_something_smart
  item.image = Rails.root.join("app/assets/images/rnd/food/"+r.rand(1..40).to_s+".jpg").open
  #item.remote_image_url = Faker::LoremPixel.image("500x400", false, 'food').to_s + "http://lorempixel.com/500/400/food.jpg"
  item.save!
end
