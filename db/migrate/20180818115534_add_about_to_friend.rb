class AddAboutToFriend < ActiveRecord::Migration[5.0]
  def change
    add_column :friends, :about, :string
  end
end
