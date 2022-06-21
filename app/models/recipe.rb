class Recipe < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  validates :preparation_time, presence: true , numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :cooking_time, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :public, presence: true, inclusion: { in:[true, false] }
end
