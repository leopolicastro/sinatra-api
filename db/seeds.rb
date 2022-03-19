# frozen_string_literal: true

require 'mongoid'
require 'sinatra'
require 'bcrypt'
require 'dotenv' if settings.development?
Dotenv.load('../.env')

# DB Setup
Mongoid.load! 'mongoid.config'

def encrypt_password(password)
  BCrypt::Password.create(password)
end

require_relative '../models/index'

require_relative '../helpers/application_helper'

puts 'Resetting database...'

User.destroy_all
Book.destroy_all

puts "Users: #{User.count}"
puts "Books: #{Book.count}"

puts 'Seeding database...'

user = User.create(email: 'admin@example.com', password: encrypt_password('abc123'), name: 'Admin', admin: true)

puts "Created#{User.count} users"

b1 = Book.create(title: 'Hyperion (Hyperion Cantos)', author: 'Dan Simmons', isbn: '0553283685', user_id: user.id)
b2 = Book.create(title: 'Dune', author: 'Frank Herbert', isbn: '0441172717', user_id: user.id)
b3 = Book.create(title: 'Foundation', author: 'Isaac Asimov', isbn: '0553293354', user_id: user.id)

puts "Created #{Book.count} books."

b1.comments.create(body: 'This is a comment1')
b2.comments.create(body: 'This is a comment2')
b3.comments.create(body: 'This is a comment3')

exit
