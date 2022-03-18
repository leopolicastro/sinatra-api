# frozen_string_literal: true

namespace '/books' do
  get '' do
    @books = Book.all
    erb 'books/index'.to_sym, layout: :default
  end

  get '/:id' do
    @book = Book.find(params[:id])
    erb 'books/show'.to_sym, layout: :default
  end
end
