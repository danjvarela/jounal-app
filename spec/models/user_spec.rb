require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:categories).dependent(:destroy) }
  it { should have_many(:tasks).through(:categories) }
end
