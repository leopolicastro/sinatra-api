# frozen_string_literal: true

helpers do
  def greet(name = "World")
    "Hello #{@current_user&.name || name}!"
  end

  def check_or_x(bool)
    if bool
      <<~HTML
        Complete: <i class='fas fa-check-circle text-success'></i>
      HTML
    else
      <<~HTML
        Complete: <i class='fas fa-times text-danger'></i>
      HTML
    end
  end

  def link_to(text, url, options = {})
    "<a href='#{url}' alt='#{text}' class='#{options[:class]}'>#{text}</a>".html_safe
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  rescue Mongoid::Errors::DocumentNotFound
    nil
  end

  def authenticate!
    redirect "/users/sign_in" unless current_user
  end

  def encrypt_password(password)
    BCrypt::Password.create(password)
  end

  def check_password(encrypted_pwd, password)
    encrypted = BCrypt::Password.new(encrypted_pwd)
    encrypted == password
  end
end
