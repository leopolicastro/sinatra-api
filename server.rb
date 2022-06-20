# frozen_string_literal: true

require "sinatra"
require "sinatra/reloader" if settings.development?

require_relative "config/index"
