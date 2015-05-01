class Selection < ActiveRecord::Base
	validates_uniqueness_of :name
	def to_param
		name
	end

end