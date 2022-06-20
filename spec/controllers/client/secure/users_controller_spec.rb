# frozen_string_literal: true

require "spec_helper"

RSpec.describe "SecureUsersController", type: :controller do
  # before each sign in the user and set the session
  before do
    user = create(:user)
    post "/users/sign_in", email: user.email, password: "abc123"
  end

  it "renders the profile page" do
    get "/users/profile"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Profile")
  end

  it "updates the users name" do
    post "/users/profile", name: "John Doe", email: Faker::Internet.email
    expect(last_response).to be_ok
    expect(last_response.body).to include("John Doe")
  end

  it "logs out the user" do
    post "/users/logout"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Sign In")
  end
end
