# frozen_string_literal: true

require_relative './books'

get '/' do
  @hello = greet
  erb :index, layout: :default
end
