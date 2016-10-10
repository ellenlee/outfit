class Request < ApplicationRecord
	validates_uniqueness_of :option, :scope => :photo

	belongs_to :asker, optional: true
	belongs_to :photo
	belongs_to :option

end
