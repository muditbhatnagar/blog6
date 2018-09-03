class FriendRequestsController < ApplicationController

	before_action :set_friend_request, except: [:index, :new, :create]

  def new
   friend_request FriendRequest.new
  end

  def create

   friend = User.find(params[:friend_id])
   @friend_request = current_user.friend_requests.new(friend: friend)
    if @friend_request.save
     redirect_to root_path, status: :created, location: @friend_request
    else
     no friend_request
    end
  end

  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  # def destroy
  #   byebug
  #  @friend_request.destroy
  #  head :no_content
  # end

  # def update
  #  @friend_request.accepte
  #   head :no_content
  #  end

  def update
   @friendship = Friendship.find_by(id: params[:id])
   if @friendship.update(accepte: true)
    redirect_to friend_requests_path, notice: "Successfully confirmed friend!"
   else
    redirect_to friend_requests_path, notice: "Sorry! Could not confirm friend!"
   end
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
   @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to root_path
  end

	def pending
		# @users=current_user
		# users = User.find_by(params[:id])
		@user = current_user.friend_requests
	end

  private
 def set_friend_request
     @friendship = Friendship.find_by(id: params[:id])
  end
end
