# frozen_string_literal: true

error do
  @danger = "Error - #{env["sinatra.error"].message}"
  erb :index, layout: :default
end

before "*" do
  if session[:notice]
    @notice = session[:notice]
    session[:notice] = nil
  end
  if session[:success]
    @success = session[:success]
    session[:success] = nil
  end
  if session[:warning]
    @warning = session[:warning]
    session[:warning] = nil
  end
  if session[:danger]
    @danger = session[:danger]
    session[:danger] = nil
  end
end
