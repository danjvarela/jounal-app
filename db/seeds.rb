user = User.find_by(email: "user@example.com")

if user.blank?
  user = User.create(email: "user@example.com", password: "password")
end

important = Category.create(name: "IMPORTANT")
Task.create name: "Learn devise", category: important

school = Category.create(name: "School")
Task.create name: "Assignment", description: "Accomplish assignments", category: school

chores = Category.create(name: "Chores")
Task.create name: "Sugar", description: "Buy sugar", category: chores
Task.create name: "Trash", description: "Take out trash", category: chores
