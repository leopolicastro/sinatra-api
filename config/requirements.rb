# frozen_string_literal: true

require 'bcrypt'

require 'active_support/isolated_execution_state'
require 'active_support/time'

require 'mongoid'
require 'securerandom'
require 'sinatra/namespace'

if settings.development?
  require 'dotenv/load'
  require 'byebug'
end
