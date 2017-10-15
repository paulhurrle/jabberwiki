class Collaborator < ActiveRecord::Base
	def self.wikis
		Wiki.where(id: pluck(:wiki_id))
	end

	def self.users
		User.where(id: pluck(:user_id))
	end
end
