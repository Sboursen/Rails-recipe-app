class Food < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  validates :measurement_unit, presence: true, length: { maximum: 250 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
