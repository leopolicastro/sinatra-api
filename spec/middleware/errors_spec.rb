# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Errors Middleware", type: :controller do
  # before each sign in the user and set the session
  before do
  end

  it "renders a notice" do
    @user = create(:user)
    post "/users/sign_in", email: @user.email, password: "abc123"
    expect(session[:notice]).to eq("You have successfully logged in")
    get "/"
    expect(last_response).to be_ok
  end
end
