# frozen_string_literal: true

require "active_support/isolated_execution_state"
require "active_support/time"
require "bcrypt"
require "mongoid"
require "securerandom"
require "sinatra/namespace"

# if settings.development? || settings.test?
require "dotenv/load"
require "byebug"
# end

# Helper Methods
require_relative "../helpers/index"

# Models
require_relative "../models/index"

# Middleware
require_relative "../middleware/index"

# API Routes
require_relative "../routes/api/v1/base"

# View Routes
require_relative "../routes/client/base"
