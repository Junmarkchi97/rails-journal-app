class Category < ApplicationRecord
  validates :name, length: { in: 3..20 }
  has_many :tasks
end
