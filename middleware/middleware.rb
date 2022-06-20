# frozen_string_literal: true

before "*" do
  session[:user_id] = @current_user.id if @current_user
end

before "/users/me" do
  authenticate!
end

before "/users/sign_out" do
  authenticate!
end

before "/users/profile" do
  authenticate!
end

before "/todos" do
  authenticate!
end
