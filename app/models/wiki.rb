class Wiki < ActiveRecord::Base
	belongs_to :user
	has_many :collaborators
	has_many :users, through: :collaborators
	# default_scope { order('rank DESC') }
		# scope :ordered_by_title, -> { order('title DESC') }
		# scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }

	validates :title, length: { minimum: 5 }, presence: true
	validates :body, length: { minimum: 20 }, presence: true

	def self.visible(user)
		wikis = []
		Wiki.all.each do |wiki|
			if !wiki.private || (user && user.admin?) || (wiki.private && wiki.user == user)
				wikis << wiki
			end
		end
		wikis
	end
end
