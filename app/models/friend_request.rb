class FriendRequest < ApplicationRecord
	 validates :name, uniqueness: true
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def accept
    user.friends << friend
    destroy
  end
end
