require "spec_helper"

RSpec.describe "Api::BaseController", type: :controller do
  it "has a content type of application/json" do
    get "/api/v1/"
    expect(last_response.headers["Content-Type"]).to eq("application/json")
  end

  it "greets the api user" do
    get "/api/v1/"
    expect(last_response.body).to include(greet)
  end

  it "converts all responses to JSON" do
    get "/api/v1/"
    expect(last_response.body).to eq(JSON.dump({greeting: greet}))
  end
end
