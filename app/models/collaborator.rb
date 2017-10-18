class Collaborator < ActiveRecord::Base
	belongs_to :user
	belongs_to :wiki
	# def self.wikis
	# 	Wiki.where(id: pluck(:wiki_id))
	# end

	# def self.users
	# 	User.where(id: pluck(:user_id))
	# end
end
