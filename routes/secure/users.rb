# frozen_string_literal: true

namespace '/users' do
  # Logout session
  delete '/sign_out' do
    if current_user
      session.clear

      request.cookies.clear

    end
    erb 'users/sign_in'.to_sym, layout: :default
  end
end
