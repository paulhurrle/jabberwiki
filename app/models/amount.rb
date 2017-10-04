class Amount < ActiveRecord::Base
	belongs_to :charge

	def default
		15_00
	end

end