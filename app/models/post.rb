class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	belongs_to :journal

	default_scope -> { order('created_at DESC')}
	validates :title, presence: true
	validates :link, presence: true
	validates :category_id, presence: true
	validates :journal_id, presence: true
end
