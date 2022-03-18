# frozen_string_literal: true

require 'mongoid'
require 'sinatra'
require 'active_support/message_encryptor'
require 'dotenv' if settings.development?
Dotenv.load('../.env')

# DB Setup
Mongoid.load! 'mongoid.config'

def encrypt_password(password)
  crypt.encrypt_and_sign(password)
end

def decrypt_password(encrypted_pwd)
  crypt.decrypt_and_verify(encrypted_pwd)
end

def crypt
  key = ENV.fetch('SESSION_SECRET')
  ActiveSupport::MessageEncryptor.new(key[0..31])
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

Book.create(title: 'Hyperion (Hyperion Cantos)', author: 'Dan Simmons', isbn: '0553283685', user_id: user.id)
Book.create(title: 'Dune', author: 'Frank Herbert', isbn: '0441172717', user_id: user.id)
Book.create(title: 'Foundation', author: 'Isaac Asimov', isbn: '0553293354', user_id: user.id)

puts "Created #{Book.count} books."

exit
