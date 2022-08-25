class Category < ApplicationRecord
  validates :name, length: { in: 3..20 }, uniqueness: true
  has_many :tasks
end
