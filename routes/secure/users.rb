# frozen_string_literal: true

namespace '/users' do
  # Logout session
  delete '/sign_out' do
    if current_user
      session[:user_id] = nil
      request.cookies.clear
      redirect '/'
    end
    erb 'users/sign_in'.to_sym, layout: :default
  end
end
