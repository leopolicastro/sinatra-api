set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(32) }, expires_in: 24.hours.from_now

# API Setup
enable :sessions, :logging

# DB Setup
Mongoid.load! 'db/mongoid.config'
