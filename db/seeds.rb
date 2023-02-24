user = User.find_by(email: "user@example.com")

if user.blank?
  user = User.create(email: "user@example.com", password: "password")
end

important = user.categories.create(name: "IMPORTANT")
important.tasks.create name: "Learn devise"

school = user.categories.create(name: "School")
school.tasks.create name: "Assignment", description: "Accomplish assignments"

chores = user.categories.create(name: "Chores")
chores.tasks.create name: "Sugar", description: "Buy sugar", category: chores
chores.tasks.create name: "Trash", description: "Take out trash", category: chores
