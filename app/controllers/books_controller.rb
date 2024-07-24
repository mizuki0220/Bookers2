class BooksController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    @book.user = @user
  end

  def show
    @user = current_user
    @book = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = current_user
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(current_user)
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
