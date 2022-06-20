# frozen_string_literal: true

namespace "/users" do
  # GET profile
  get "/profile" do
    erb :"users/profile", layout: :default
  end

  post "/profile" do
    @current_user.update(name: params[:name], email: params[:email])
    erb :"users/profile", layout: :default
  end
  # Logout session
  post "/logout" do
    session[:user_id] = nil
    @notice = "You have successfully logged out"

    request.cookies.clear

    erb :"users/sign_in", layout: :default
  end
end
