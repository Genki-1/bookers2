class BooksController < ApplicationController
  def index
  	@book = Book.new
  end

  def show
  	@book = Book.new
  end

  def new
  end

  def create
  end

  def edit
  end
end
