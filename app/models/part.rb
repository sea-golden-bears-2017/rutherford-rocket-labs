class Part < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :orders_parts
  has_many :orders, through: :orders_parts
  has_many :parts_warehouses
  has_many :warehouses, through: :parts_warehouses
end
