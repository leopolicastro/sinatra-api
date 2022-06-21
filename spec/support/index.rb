# frozen_string_literal: true

def app
  Sinatra::Application
end

def session
  last_request.env["rack.session"]
end
