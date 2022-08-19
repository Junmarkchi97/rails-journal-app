class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { in: 10..100 }
end
