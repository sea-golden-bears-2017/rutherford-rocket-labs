class Warehouse < ApplicationRecord
  validates :name, :location, presence: true
  has_many :parts_warehouses
  has_many :parts, through: :parts_warehouses
  has_many :orders
end
