# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Errors Middleware", type: :controller do
  # before each sign in the user and set the session

  it "check_or_x(false) returns danger font awesome tag" do
    expect(check_or_x(false)).to eq("Complete: <i class='fas fa-times text-danger'></i>\n")
  end

  it "check_or_x(true) returns check font awesome tag" do
    expect(check_or_x(true)).to eq("Complete: <i class='fas fa-check-circle text-success'></i>\n")
  end
end
