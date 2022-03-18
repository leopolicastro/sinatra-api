# frozen_string_literal: true

namespace '/users' do
  # Logout session
  post '/logout' do
    session[:user_id] = nil

    request.cookies.clear

    erb 'users/sign_in'.to_sym, layout: :default
  end
end
