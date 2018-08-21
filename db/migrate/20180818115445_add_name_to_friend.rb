class AddNameToFriend < ActiveRecord::Migration[5.0]
  def change
    add_column :friends, :name, :string
  end
end
