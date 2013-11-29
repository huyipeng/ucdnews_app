class AddJournalidToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :journal_id, :integer
  end
end
