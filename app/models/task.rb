class Task < ApplicationRecord
  validates :name, presence: true, length: { in: 3..30 }
  validates  :details, presence: true, length: { in: 3..100 }
  validates :due_date, presence: true
  belongs_to :category
end
