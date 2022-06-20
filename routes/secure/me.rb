# frozen_string_literal: true

namespace "/users" do
  get "/me" do
    @user = @current_user
    erb :"users/show", layout: :default
  end
end
