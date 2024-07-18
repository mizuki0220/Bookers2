class BooksController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @book = Book.new
  end

  def show
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    render_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
