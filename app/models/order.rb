class Order < ApplicationRecord
  has_many :orders_parts
  has_many :parts, through: :orders_parts
end
