# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Seed data for tasks
tasks_data = [
  {
    title: 'Task 1',
    description: 'Description of Task 1',
    due_date: Date.today + 7.days,
    status: 'inprogress',
    completed_date: nil,
    priority: 'high',
    assigned_to: 2,
    assigned_by: 'Admin'
  },
  {
    title: 'Task 2',
    description: 'Description of Task 2',
    due_date: Date.today + 14.days,
    status: 'created',
    completed_date: nil,
    priority: 'low',
    assigned_to: 3,
    assigned_by: 'Admin'
  },
  {
    title: 'Task 3',
    description: 'Description of Task 3',
    due_date: Date.today + 1.days,
    status: 'completed',
    completed_date: nil,
    priority: 'high',
    assigned_to: 2,
    assigned_by: 'Admin'
  },
  {
    title: 'Task 4',
    description: 'Description of Task 4',
    due_date: Date.today + 3.days,
    status: 'created',
    completed_date: nil,
    priority: 'medium',
    assigned_to: 3,
    assigned_by: 'Admin'
  },
  # Add more tasks as needed
]

# Seed tasks
tasks_data.each do |task_data|
  Task.create!(task_data)
end

# Seed data for users
users_data = [
  { name: 'Admin', email: 'admin@example.com', role: 'admin' },
  { name: 'John', email: 'john@example.com', role: 'employee' },
  { name: 'Smith', email: 'smith@example.com', role: 'employee' },
  { name: 'Alice', email: 'alice@example.com', role: 'employee' },
  # Add more users as needed
]

# Seed users
users_data.each do |user_data|
  User.create!(user_data)
end
