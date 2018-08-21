class AddImageToFriend < ActiveRecord::Migration[5.0]
  def change
    add_column :friends, :image, :string
  end
end
