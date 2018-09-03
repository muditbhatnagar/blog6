class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(name: params[:user][:name], image: params[:user][:image], email: params[:user][:email], about: params[:user][:about])
		@user.save
		redirect_to users_path(@user)
	end

	def show
		@user = User.find(params[:id])
	end

	def index
		if params[:name].present?
	   @user = User.where("name like ?", "%#{params[:name]}%")
	  else
	   @user = User.all
	  end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	def destroy
	  current_user.remove_friend(@friend)
	  head :no_content
  end

	def myfrnd
		user = current_user
		@users = user.friends
	end

	 def omniauth_failure
    redirect_to init_sign_in_users_path
    #redirect wherever you want.
  end
end
