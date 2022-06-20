# frozen_string_literal: true

require "spec_helper"

RSpec.describe "OpenUsersController", type: :controller do
  it "renders the login page" do
    get "/users/sign_in"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Sign In")
  end

  it "signs in a user" do
    user = create(:user)
    post "/users/sign_in", email: user.email, password: "abc123"
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include("Logout")
  end

  it "renders the sign up page" do
    get "/users/sign_up"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Sign Up")
  end

  it "signs up a user" do
    post "/users/sign_up", name: "John Doe", email: Faker::Internet.email, password: "abc123"
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include("Logout")
  end

  it "redirects to sign in when an unauthenticated users access a secure page" do
    get "/users/profile"
    expect(last_response.status).to eq(302)
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include("Sign In")
  end
end
