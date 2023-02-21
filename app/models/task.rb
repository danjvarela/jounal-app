class Task < ApplicationRecord
  belongs_to :category
  has_one :user, through: :category
  validates :name, presence: true, length: {maximum: 50}
  validates :description, length: {maximum: 256}
end
