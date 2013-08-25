class Category < ActiveRecord::Base
  belongs_to :user
  default_scope -> {order('created_at ASC')}
  validates :content, presence: true
  validates :user_id, presence: true
end
