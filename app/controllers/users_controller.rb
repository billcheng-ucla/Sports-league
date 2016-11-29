class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		
	end
	def create
		@user = User.new(user_params)
		if @user.valid?
			@user.save
			UserMailer.welcome_email(@user).deliver_later
			flash[:success] = "New #{@user.role} account created."
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:error] = @user.errors.full_messages.join(". ")
			redirect_to root_path
		end
	end
private
	def user_params
		params.require(:user).permit(:username, :email, :password, :role)
	end
end
