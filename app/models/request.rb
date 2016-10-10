class Request < ApplicationRecord
	belongs_to :asker, optional: true
	belongs_to :photo
	belongs_to :option

end
