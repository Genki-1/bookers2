class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@books = Book.all
  	@newbook = Book.new
  end


end