class Task < ApplicationRecord
  DATE_FORMAT = "%B %e, %Y"
  belongs_to :category
  validates :name, presence: true, length: {minimum: 5}

  # returns an array of all the tasks grouped into days
  def self.grouped_per_day
    all.order(created_at: :desc).each_with_object({}) do |task, days|
      day = task.created_at.strftime DATE_FORMAT

      if days[day]
        days[day].push task
      else
        days[day] = [task]
      end
    end
  end
end
