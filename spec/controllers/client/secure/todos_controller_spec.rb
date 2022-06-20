# frozen_string_literal: true

require "spec_helper"

RSpec.describe "TodosController", type: :controller do
  # before each sign in the user and set the session
  before do
    @user = create(:user)
    post "/users/sign_in", email: @user.email, password: "abc123"
    post "/todos", title: "Buy milk", due_date: "2020-01-01", description: "Buy milk"
  end

  it "renders the todos page" do
    get "/todos"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Buy milk")
  end

  it "creates a new Todo" do
    post "/todos", title: "New Todo", due_date: "2020-01-01", description: "This is a new Todo"
    expect(last_response.status).to eq(201)
    expect(last_response.body).to include("New Todo")
  end

  it "renders the todos by id" do
    get "/todos/#{Todo.last.id}"
    expect(last_response).to be_ok
    expect(last_response.body).to include(Todo.last.title)
  end

  it "renders the todos edit page" do
    get "/todos/#{Todo.last.id}/edit"
    expect(last_response).to be_ok
    expect(last_response.body).to include(Todo.last.title)
  end

  it "updates a Todo" do
    post "/todos/#{Todo.last.id}/edit", title: "Updated Todo", due_date: "2020-01-01", description: "This is an updated Todo"
    expect(last_response.status).to eq(302)
    # expect it to redirect
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include("Updated Todo")
  end

  it "deletes a Todo" do
    todo = Todo.last
    post "/todos/#{todo.id}/delete"
    expect(last_response.status).to eq(302)
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include("Todo destroyed")
  end
end
