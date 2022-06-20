# frozen_string_literal: true

require "spec_helper"

RSpec.describe "MeController", type: :controller do
  # before each sign in the user and set the session
  before do
    @user = create(:user)
    post "/users/sign_in", email: @user.email, password: "abc123"
  end

  it "renders the me page" do
    get "/users/me"
    expect(last_response).to be_ok
    expect(last_response.body).to include(@user.name)
  end
end
