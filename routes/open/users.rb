# frozen_string_literal: true

before '/users/sign_*' do
  if current_user
    session[:user_id] = @current_user.id
    redirect '/'
  end
end

namespace '/users' do
  # New session
  get '/sign_in' do
    erb 'users/sign_in'.to_sym, layout: :default
  end

  # Sign Up
  get '/sign_up' do
    erb 'users/sign_up'.to_sym, layout: :default
  end

  # Post sign in
  post '/sign_in' do
    @current_user = User.find_by(email: params[:email])

    if @current_user.nil?
      redirect 'users/sign_in', error: 'Invalid email or password'
    elsif params[:password] == decrypt_password(@current_user.password)
      session[:user_id] = @current_user.id
      redirect '/'
    else
      redirect 'users/sign_in', error: 'Invalid email or password'
    end
  end
end
