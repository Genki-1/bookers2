class UsersController < ApplicationController

	before_action :ensure_correct_user, only: [:edit, :update]

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
    	user = User.find(params[:id])
    	user.update(user_params)
    	redirect_to user_path(user)
    end

    def ensure_correct_user
	    @user = User.find(params[:id])
	    if @user.id != current_user.id
	      redirect_to user_path(current_user.id)
	    end
	end


    private

	def user_params
	  params.require(:user).permit(:name, :introduction, :profile_image)
	end

end