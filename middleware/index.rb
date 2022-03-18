# frozen_string_literal: true

before '*' do
  session[:user_id] = @current_user.id if @current_user
end

before '/books' do
  authenticate!
end

before '/users/me' do
  authenticate!
end

before '/users/sign_out' do
  authenticate!
end
