class AddAcceptedToFriendship < ActiveRecord::Migration[5.0]
  def change
    add_column :friendships, :accepte, :boolean, default: false
  end
end
