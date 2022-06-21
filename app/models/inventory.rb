class Inventory < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }

  belongs_to :user
end
