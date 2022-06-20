# frozen_string_literal: true

require "mongoid"
require "sinatra"
require "bcrypt"
require "dotenv" if settings.development?
Dotenv.load("../.env")

# DB Setup
Mongoid.load! "mongoid.config"

def encrypt_password(password)
  BCrypt::Password.create(password)
end

require_relative "../models/index"

require_relative "../helpers/index"

puts "Resetting database..."

User.destroy_all
Todo.destroy_all

puts "Users: #{User.count}"

puts "Seeding database..."

admin_user = User.create(email: "admin@example.com", password: encrypt_password("abc123"), name: "Admin", admin: true)
user = User.create(email: "some@example.com", password: encrypt_password("abc123"), name: "Some User", admin: false)

puts "Created #{User.count} users"

Todo.create(title: "Buy milk", user:, due_date: Date.today, description: "Buy some milk", complete: false)
Todo.create(title: "Buy juice", user: admin_user, due_date: Date.today, description: "Buy some milk", complete: false)

puts "Created #{Todo.count} todos"

puts "Done!"
exit
