class OrdersPart < ApplicationRecord
  belongs_to :order
  belongs_to :part
  validates :quantity_ordered, presence: true
end
