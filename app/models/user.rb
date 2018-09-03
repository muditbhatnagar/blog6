class User < ApplicationRecord

	mount_uploader :image, AvatarUploader
	has_friendship
  has_many :incoming_friend_requests,
   class_name: 'FriendRequest',
   source: :friend

	# before_create :confirmation_token
  has_many :authentications, dependent: :destroy
	

	has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, dependent: :destroy
 	has_many :friend_requests, dependent: :destroy
  # has_many :pending_friends, through: :friend_requests, source: :friend, dependent: :destroy
	has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"
	has_many :active_friends, -> { where(friendships: { accepte: true}) }, through: :friendships, source: :friend
	has_many :received_friends, -> { where(friendships: { accepte: true}) }, through: :received_friendships, source: :user, dependent: :destroy
	# has_many :pending_friends, -> { where(friendships: { accepte: false}) }, through: :friendships, source: :friend
	has_many :requested_friendships, -> { where(friendships: { accepte: false}) }, through: :received_friendships, source: :user
	
	# to call all your friends
	def friends
	  active_friends | received_friends
	end

	# to call your pending sent or received
	def pending
		pending_friends | requested_friendships
	end

	def pending_friends
		Friendship.where(friend_id: self.id, accepte: false)
	end

	def accepted_friends
		Friendship.where(friend_id: self.id, accepte: true)
	end

	def remove_friend(friend)
    current_user.friends.destroy(friend)
  end
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end

