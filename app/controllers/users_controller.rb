class UsersController < ApplicationController

	def index
		@users = User.all
		@newbook = Book.new
	end


    def show
  		@user = User.find(params[:id])
  		@books = Book.all
  		@newbook = Book.new
    end

    def edit
    	@user = User.find(params[:id])
    end

    def update
    end


end