class RequestsController < ApplicationController
	 before_action :set_friend_request, except: [:index, :create]

	def create
    friend = User.find(params[:friend_id])
    @request = current_user.requests.new(friend: friend)

    if @request.save
      render :show, status: :created, location: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  private

  def request
    @request = Request.find(params[:id])
  end

  def index
	  @incoming = Request.where(friend: current_user)
	  @outgoing = current_user.requests
	end

	def destroy
	  @request.destroy
	  head :no_content
	end

	def update
  @request.accept
  head :no_content
end

end
