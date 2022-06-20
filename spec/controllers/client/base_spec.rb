# frozen_string_literal: true

require "spec_helper"

RSpec.describe "BaseController", type: :controller do
  it "renders the home page" do
    get "/"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Hello World")
  end
end
