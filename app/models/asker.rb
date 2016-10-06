class Asker < ApplicationRecord
	validates_presence_of :email
	
	has_many :photos
end
