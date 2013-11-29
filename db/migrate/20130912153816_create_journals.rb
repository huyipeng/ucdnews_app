class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.text :note
      t.integer :journalnum
      t.date :starttime
      t.date :endtime
      t.integer :creator_id

      t.timestamps
    end
  end
end
