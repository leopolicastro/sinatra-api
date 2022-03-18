# frozen_string_literal: true

require 'sinatra'

require_relative './config/requirements'

require_relative './config/setup'

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
