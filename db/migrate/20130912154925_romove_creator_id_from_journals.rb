class RomoveCreatorIdFromJournals < ActiveRecord::Migration
  def change
  	remove_column :journals, :creator_id, :integer
  	add_column :journals, :user_id, :integer
  end
end
