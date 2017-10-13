class Wiki < ActiveRecord::Base
	belongs_to :user
	# scope :visible, lambda { where(!wiki.private || (current_user && current_user.admin?) || (wiki.private && wiki.user == current_user)) }

	# default_scope { order('rank DESC') }
		# scope :ordered_by_title, -> { order('title DESC') }
		# scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }

	validates :title, length: { minimum: 5 }, presence: true
	validates :body, length: { minimum: 20 }, presence: true

	# def self.visible
	# 	wikis = []
	# 	@wikis.each do |wiki|
	# 		if !wiki.private || (current_user && current_user.admin?) || (wiki.private && wiki.user == current_user)
	# 			wikis << wiki
	# 		end
	# 	end
	# 	wikis
	# end
end
