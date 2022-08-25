class Task < ApplicationRecord
  validates :name, presence: true, length: { in: 3..20 }
  validates  :details, presence: true, length: { in: 3..100 }
  belongs_to :category
end
