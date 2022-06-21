class Inventory < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
end
