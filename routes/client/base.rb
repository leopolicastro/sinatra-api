# frozen_string_literal: true

# Open Routes
require_relative "./open/users"
# Secure Routes

require_relative "./secure/me"
require_relative "./secure/todos"
require_relative "./secure/users"

get "/" do
  @hello = greet
  erb :index, layout: :default
end
