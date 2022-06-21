# frozen_string_literal: true

before "/users/sign_*" do
  if current_user
    session[:user_id] = @current_user.id
    redirect "/"
  end
end

namespace "/users" do
  # New session
  get "/sign_in" do
    erb :"users/sign_in", layout: :default
  end

  # Post sign in
  post "/sign_in" do
    begin
      @current_user = User.find_by(email: params[:email])
    rescue Mongoid::Errors::DocumentNotFound
      @danger = "Invalid email or password"
      return erb :"users/sign_in", layout: :default
    end

    if check_password(@current_user.password, params[:password])
      session[:user_id] = @current_user.id
      session[:notice] = "You have successfully logged in"
      return redirect "/"
    else
      return redirect "users/sign_in", error: "Invalid email or password"
    end
  end

  # Sign Up
  get "/sign_up" do
    erb :"users/sign_up", layout: :default
  end

  # Post sign up
  post "/sign_up" do
    # Make sure the email is not already in use
    redirect "users/sign_up", error: "Email already in use" if User.where(email: params[:email]).any?
    # Create user and save
    @user = User.new(name: params[:name],
      email: params[:email],
      password: encrypt_password(params[:password]),
      admin: false)

    if @user.save
      @notice = "You have successfully signed up"
      session[:user_id] = @user.id
      redirect "/"
    else
      redirect "users/sign_up", error: "Invalid email or password"
    end
  end
end
