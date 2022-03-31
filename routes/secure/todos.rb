# frozen_string_literal: true

namespace '/todos' do
  get '' do
    @todos = current_user.todos
    erb 'todos/index'.to_sym, layout: :default
  end

  get '/:id' do
    @todo = Todo.find(params[:id])
    erb 'todos/show'.to_sym, layout: :default
  end

  post '' do
    @todo = Todo.create!(
      user_id: current_user.id,
      title: params[:title],
      due_date: params[:due_date],
      description: params[:description],
      complete: false
    )
    session[:success] = 'Todo added'
    erb 'todos/show'.to_sym, layout: :default
  end

  get '/:id/edit' do
    @todo = Todo.find(params[:id])
    erb 'todos/edit'.to_sym, layout: :default
  end

  post '/:id/edit' do
    @todo = Todo.find(params[:id])
    @todo.update!(
      title: params[:title],
      due_date: params[:due_date],
      description: params[:description],
      complete: params[:complete] == 'true'
    )
    session[:success] = 'Todo updated'
    redirect "/todos/#{@todo.id}"
  end

  post '/:id/delete' do
    @todo = Todo.find(params[:id])
    @todo.destroy!
    @todos = current_user.todos
    session[:success] = 'Todo destroyed'
    redirect '/todos'
  end
end
