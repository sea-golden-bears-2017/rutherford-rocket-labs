class Order < ApplicationRecord
  has_many :orders_parts
  has_many :parts, through: :orders_parts

  def houston_time
    time = self.created_at.in_time_zone("Central Time (US & Canada)")
    time.strftime("%Y-%m-%d %H:%M:%S") + " Houston Time"
  end

end
