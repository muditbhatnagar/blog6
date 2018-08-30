class FriendshipsController < ApplicationController
	def create
	  @friendship = current_user.friendships.build(friend_id: params[:friend_id])
	  if @friendship.save
	    flash[:notice] = "Friend requested."
	    redirect_to users_path
	  else
	    flash[:error] = "Unable to request friendship."
	    redirect_to users_path
	  end
	end

	def index
		@friendship = Friendship.all
	end

	def profile
	  current_user == @user
	end

	def update
	 @friendship = Friendship.find_by(id: params[:id])
	 @friendship.update(accepte: true)
 	  if @friendship.save
     redirect_to root_url, notice: "Successfully confirmed friend!"
 	  else
     redirect_to root_url, notice: "Sorry! Could not confirm friend!"
 	  end
	end

	def destroy
	  @friendship = Friendship.find_by(id: params[:id])
	  @friendship.destroy
	  flash[:notice] = "Removed friendship."
	  redirect_to users_path
	end

	def friend
		@users = User.all
		if params[:search]
			@users = User.search(params[:search]).order("created_at DESC")
		else
			@users = User.all.order("created_at DESC")
		end
	end

	def friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end