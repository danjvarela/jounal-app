class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}

  after_create_commit -> { broadcast_append_to "categories" }
end
