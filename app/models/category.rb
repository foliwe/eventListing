class Category < ApplicationRecord

  validates :name , presence: true, uniqueness: true
  has_many :event_categories
  has_many :events , through: :event_categories
end
