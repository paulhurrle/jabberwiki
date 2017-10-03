class Wiki < ActiveRecord::Base
	belongs_to :user

	# default_scope { order('rank DESC') }
		# scope :ordered_by_title, -> { order('title DESC') }
		# scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }

	validates :title, length: { minimum: 5 }, presence: true
	validates :body, length: { minimum: 20 }, presence: true
end
