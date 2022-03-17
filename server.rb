require 'sinatra'
require 'sinatra/namespace'
require 'mongoid'

# API Setup
enable  :sessions, :logging

# DB Setup
Mongoid.load! 'db/mongoid.config'

# Helper Methods
require_relative 'helpers/application_helper'

# Models
require_relative 'models/index'

# API Routes
require_relative 'api/v1/base'

# View Routes
require_relative 'routes/base'
