require "rails_helper"

RSpec.describe Task, type: :model do
  subject { FactoryBot.create :task }

  it { should belong_to(:category) }
  it { should have_one(:user).through(:category) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_length_of(:description).is_at_most(256) }
end
