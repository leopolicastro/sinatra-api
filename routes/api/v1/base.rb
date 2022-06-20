# frozen_string_literal: true

namespace "/api/v1" do
  before do
    content_type "application/json"
  end

  get "/" do
    {greeting: greet}
  end

  after do
    # Convert all responses to JSON
    response.body = JSON.dump(response.body)
  end
end
