# frozen_string_literal: true

namespace "/todos" do
  get "" do
    @todos = current_user.todos
    erb :"todos/index", layout: :default
  end

  get "/:id" do
    @todo = Todo.find(params[:id])
    erb :"todos/show", layout: :default
  end

  post "" do
    @todo = Todo.create!(
      user_id: current_user.id,
      title: params[:title],
      due_date: params[:due_date],
      description: params[:description],
      complete: false
    )
    session[:success] = "Todo added"
    @todos = current_user.todos
    status 201
    erb :"todos/index", layout: :default
  end

  get "/:id/edit" do
    @todo = Todo.find(params[:id])
    erb :"todos/edit", layout: :default
  end

  post "/:id/edit" do
    @todo = Todo.find(params[:id])
    @todo.update!(
      title: params[:title],
      due_date: params[:due_date],
      description: params[:description],
      complete: params[:complete] == "true"
    )
    @todos = current_user.todos
    # status 302
    session[:success] = "Todo updated"
    redirect "/todos"
  end

  post "/:id/delete" do
    @todo = Todo.find(params[:id])
    @todo.destroy!
    @todos = current_user.todos
    session[:success] = "Todo destroyed"
    redirect "/todos"
  end
end
