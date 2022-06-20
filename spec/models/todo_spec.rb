require "spec_helper"

# frozen_string_literal: true

RSpec.describe Todo, type: :model do
  before do
    Todo.delete_all
  end

  it "is valid with valid attributes" do
    todo = build(:todo)
    expect(todo).to be_valid
  end

  context "Validations" do
    it "validates presence of title" do
      todo = build(:todo, title: nil)
      expect(todo).to_not be_valid
    end
  end

  context "Associations" do
    it "belongs to a user" do
      user = create(:user)
      todo = create(:todo, user: user)
      expect(todo.user).to be_a(User)
      expect(todo.user).to eq(user)
    end
  end

  context "Scopes" do
    it "scopes completed" do
      create(:todo, complete: true)
      create(:todo, complete: false)
      expect(Todo.completed.count).to eq(1)
    end

    it "scopes incomplete" do
      create(:todo, complete: true)
      create(:todo, complete: false)
      expect(Todo.incomplete.count).to eq(1)
    end
  end
end
