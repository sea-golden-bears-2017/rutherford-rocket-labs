require 'bcrypt'

class User < ApplicationRecord
  validates :first_name, :last_name, :username, presence: true
  has_many :created_orders, foreign_key: :creator_id, :class_name => 'Order'
  has_many :processed_orders, foreign_key: :processor_id, :class_name => 'Order'
  has_secure_password
end
