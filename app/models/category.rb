class Category < ActiveRecord::Base
  belongs_to :user

  has_many :posts

  default_scope -> {order('id ASC')}
  validates :content, presence: true
  validates :user_id, presence: true
end
