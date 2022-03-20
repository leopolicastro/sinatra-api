# frozen_string_literal: true

namespace '/books' do
  get '' do
    @books = Book.where(user_id: session[:user_id])
    erb 'books/index'.to_sym, layout: :default
  end

  get '/:book_id/' do
    @book = Book.find(params[:book_id])
    erb 'books/show'.to_sym, layout: :default
  end

  post '/:book_id/comments' do
    @book = Book.find(params[:book_id])
    if @book.comments.create(body: params['body'])
      session[:success] = 'Comment added'
      redirect "/books/#{@book.id}/"
    else
      session[:danger] = 'Error adding comment'
      redirect '/books'
    end
  end
end
