require 'bcrypt'

class User < ApplicationRecord
  validates :first_name, :last_name, :username, :admin, presence: true
  has_many :orders, foreign_key: :creator_id
  has_many :orders, foreign_key: :processor_id
  has_secure_password
end
