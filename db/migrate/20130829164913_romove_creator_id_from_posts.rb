class RomoveCreatorIdFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :creator_id, :integer
  	add_column :posts, :user_id, :integer
  end
end
