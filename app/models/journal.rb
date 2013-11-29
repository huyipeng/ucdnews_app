class Journal < ActiveRecord::Base
	belongs_to :user

	has_many :posts, dependent: :destroy

	default_scope -> {order('journalnum DESC')}
    validates :user_id, presence: true
    validates :starttime, presence: true
    validates :endtime, presence: true
    validates :journalnum, presence: true, uniqueness: true
end
