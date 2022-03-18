# frozen_string_literal: true

after '*' do
  session[:user_id] = @current_user.id if @current_user
end

before '/books*' do
  authenticate!
end

before '/users/*' do
  authenticate!
end
