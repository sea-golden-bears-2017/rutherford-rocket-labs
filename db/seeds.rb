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

orders = Order.all

10.times do
  order = Order.new(conditions.sample)
  order.warehouse = locations.sample
  order.save
end

50.times do
  OrdersPart.create!(order: orders.sample, part: parts.sample, quantity_ordered: 4)
end
