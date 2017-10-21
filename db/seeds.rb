require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Part.destroy_all
Order.destroy_all
OrdersPart.destroy_all
Warehouse.destroy_all
PartsWarehouse.destroy_all

conditions = [{submitted: false, processed: false}, {submitted: true, processed: false}]

locations = []


30.times do
  Part.create(name: Faker::Science.element)
end

parts = Part.all


10.times do
  locations << Warehouse.create(location: Faker::Address.city)
end

locations.each do |location|
  10.times do
    num = rand(5..25)
    PartsWarehouse.create(warehouse: location, part: parts.sample, quantity: num)
  end
end


10.times do
  order = Order.new(conditions.sample)
  order.warehouse = locations.sample
  order.save
end

orders = Order.all

50.times do
  OrdersPart.create!(order: orders.sample, part: parts.sample, quantity_ordered: rand(0..100))
end

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "ham",
    username: Faker::Dessert.variety.delete(" ").downcase
  )
end

Order.all.each do |order|
  order.creator = User.all.sample
  if rand(0..1) == 0 && order.submitted
    order.orders_parts.each do |part|
      part.quantity_received = rand(0..200)
      part.save
    end
    order.processed = true
    order.processor = User.all.sample
  end
  order.save
end

User.create(
  first_name: "George",
  last_name: "Rutherford III",
  password: "rrl",
  username: "gwr3",
  admin: true
)
