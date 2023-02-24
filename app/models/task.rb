class Task < ApplicationRecord
  default_scope { order(created_at: :asc) }
  belongs_to :category
  has_one :user, through: :category, inverse_of: :tasks
  validates :name, presence: true, length: {maximum: 50}
  validates :description, length: {maximum: 256}
end
