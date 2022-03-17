# frozen_string_literal: true

require 'mongoid'

# DB Setup
Mongoid.load! 'mongoid.config'

require_relative '../models/index'

User.create(email: 'admin@example.com', password: 'abc123', name: 'Admin', admin: true)

puts "Created#{User.count} users"

Book.create(title: 'Hyperion (Hyperion Cantos)', author: 'Dan Simmons', isbn: '0553283685')
Book.create(title: 'Dune', author: 'Frank Herbert', isbn: '0441172717')
Book.create(title: 'Foundation', author: 'Isaac Asimov', isbn: '0553293354')

puts "Created #{Book.count} books."
