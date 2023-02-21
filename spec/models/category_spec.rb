require "rails_helper"

RSpec.describe Category, type: :model do
  subject { FactoryBot.create :category }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should have_many(:tasks).dependent(:destroy) }
end
