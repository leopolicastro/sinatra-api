# frozen_string_literal: true

helpers do
  def greet(name = 'World')
    "Hello #{name}!"
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
    redirect '/users/sign_in' unless current_user
  end

  def encrypt_password(password)
    crypt.encrypt_and_sign(password)
  end

  def decrypt_password(encrypted_pwd)
    crypt.decrypt_and_verify(encrypted_pwd)
  end

  private

  def crypt
    key = ENV.fetch('SESSION_SECRET')
    ActiveSupport::MessageEncryptor.new(key[0..31])
  end
end
