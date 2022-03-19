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
    @book.comments.create(body: params['body'])
    redirect "/books/#{@book.id}/"
  end
end
