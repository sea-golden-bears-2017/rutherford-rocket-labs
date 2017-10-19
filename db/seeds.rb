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


parts = []
orders = []

10.times do
  part = Part.create(name: Faker::Science.element)
  parts << part
end


10.times do
  order = Order.create()
  orders << order
end


5.times do
  OrdersPart.create(order: orders.sample, part: parts.sample, quantity_ordered: 4)
end
