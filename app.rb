# frozen_string_literal: true

require 'sinatra'
require_relative './config/requirements'

set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(32) }, expires: 24.hours.from_now

# API Setup
enable :sessions, :logging

# DB Setup
Mongoid.load! 'db/mongoid.config'

# Helper Methods
require_relative 'helpers/application_helper'

# Models
require_relative 'models/index'

# Middleware
require_relative 'middleware/index'

# API Routes
require_relative 'api/v1/base'

# View Routes
require_relative 'routes/base'
