user = User.find_by(email: "user@example.com")

if user.blank?
  user = User.create(email: "user@example.com", password: "password")
end

3.times do
  category = FactoryBot.create(:category, user: user)
  3.times { |n| FactoryBot.create(:task, category: category) }
end
