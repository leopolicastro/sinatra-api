# frozen_string_literal: true

set :server, "puma"
set :session_secret, ENV.fetch("SESSION_SECRET") { SecureRandom.hex(32) }, expires_in: 24.hours.from_now

# API Setup
enable :sessions, :logging, :reloader

# DB Setup
Mongoid.load! "db/mongoid.config"

# Error Handling
set :show_exceptions, false
