class PartsWarehouse < ApplicationRecord
  belongs_to :part
  belongs_to :warehouse
end
