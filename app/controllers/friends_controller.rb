class FriendsController < ApplicationController
	 before_action :set_friend, only: :destroy
	def new
		@friend = Friend.new
	end

	def create
		@friend = Friend.new(name: params[:friend][:name], image: params[:friend][:image], email: params[:friend][:email], about: params[:friend][:about])
		@friend.save
		redirect_to friends_path(@friend)
	end

	def show
		@friendship = User.find(params[:id])
	end

	def index
		@friend = current_user.friends
	end

	def friend
		user = current_user
		@users = user.friends
	end

	def friendprofile
		@friendship = User.find(params[:id])
	end

  private
	def set_friend
	  @friend = current_user.friends.find(params[:id])
	end
end
