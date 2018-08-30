class RequestsController < ApplicationController
	 before_action :set_friend_request, except: [:index, :create]

  def request
    # @users=current_user
    # users = User.find_by(params[:id])
  end

end
 