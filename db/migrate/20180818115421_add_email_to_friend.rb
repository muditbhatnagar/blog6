class AddEmailToFriend < ActiveRecord::Migration[5.0]
  def change
    add_column :friends, :email, :string
  end
end
