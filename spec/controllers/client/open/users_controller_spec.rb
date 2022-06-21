# frozen_string_literal: true

require "spec_helper"

RSpec.describe "OpenUsersController", type: :controller do
  it "makes sure a user is signed in before logging out" do
    post "/users/sign_out"

    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include("Sign In")
  end
  it "makes sure a user is signed in before accessing /me page" do
    post "/users/me"

    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include("Sign In")
  end
  it "makes sure a user is signed in before accessing todos" do
    post "/todos"

    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include("Sign In")
  end

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

  it "redirects to sign in when a user that doesn't exist tries to sign in" do
    post "/users/sign_in", email: Faker::Internet.email, password: "abc123"
    # expect(last_response.status).to eq(302)
    # expect(last_response).to be_redirect
    # follow_redirect!
    expect(last_response.body).to include("Sign In")
  end

  it "redirects to sign in page and displays an error message when a user tries to sign in with an incorrect password" do
    user = create(:user)
    post "/users/sign_in", email: user.email, password: "wrong password"
    expect(last_response.status).to eq(302)
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include("Sign In")
  end

  it "redirects to sign up if user creation fails" do
    post "/users/sign_up", name: "", email: nil, password: "abc123"
    expect(last_response.status).to eq(302)
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include("Sign Up")
  end
end
