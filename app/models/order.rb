class Order < ApplicationRecord
  has_many :orders_parts
  has_many :parts, through: :orders_parts
  belongs_to :creator, class_name: :User
  belongs_to :processor, class_name: :User

  def houston_time(type)
    if type.to_s == 'created'
      houston_time_handler(self.created_at)
    elsif type.to_s == 'updated'
      houston_time_handler(self.updated_at)
    else
      nil
    end
  end

  private
    def houston_time_handler(time)
      time = time.in_time_zone("Central Time (US & Canada)")
      time.strftime("%Y-%m-%d %H:%M:%S") + " Houston Time"
    end

end
