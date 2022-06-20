require "spec_helper"

# frozen_string_literal: true

RSpec.describe User, type: :model do
  before do
    User.delete_all
  end
  it "is valid with valid attributes" do
    user = build(:user)
    expect(user).to be_valid
    expect(user.admin).to be false
  end

  context "Admin users" do
    it "is valid with valid attributes" do
      admin = build(:admin)
      expect(admin).to be_valid
      expect(admin.admin).to be true
    end
  end

  context "Validations" do
    it "validates presence of name" do
      user = User.create(email: "some@example.com")
      expect(user).to_not be_valid
    end

    it "validates presence of email" do
      user = User.create(name: "Some Name")
      expect(user).to_not be_valid
    end
  end

  context "Scopes" do
    it "scopes admins" do
      create(:user, admin: true)
      create(:user, admin: false)
      expect(User.admin.count).to eq(1)
    end
  end

  context "Associations" do
    it "has many todos" do
      user = create(:user)
      create(:todo, user: user)
      create(:todo, user: user)
      expect(user.todos.count).to eq(2)
    end
  end
end
