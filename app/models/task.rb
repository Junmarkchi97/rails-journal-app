class Task < ApplicationRecord
  validates :name, presence: true, length: { in: 3..10 }
  validates  :description, presence: true, length: { in: 3..100 }
  belongs_to :category
end
