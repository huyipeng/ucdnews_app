class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.text :note
      t.string :author
      t.integer :creator_id
      t.integer :category_id

      t.timestamps
    end

  end
end
