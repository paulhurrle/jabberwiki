class Wiki < ActiveRecord::Base
	belongs_to :user
	has_many :collaborators
	has_many :users, through: :collaborators

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
