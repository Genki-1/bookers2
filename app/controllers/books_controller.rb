class BooksController < ApplicationController

  before_action :ensure_correct_user, only: [:edit, :update, :destroy]


  def index
    @books = Book.all
  	@book = Book.new
    @newbook = Book.new
  end

  def show
    @user = User.find(params[:id])
  	@newbook = Book.new
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(current_user.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def top
  end

  def ensure_correct_user
      @user = User.find(params[:id])
      if @user.id != current_user.id
        redirect_to books_path
      end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
