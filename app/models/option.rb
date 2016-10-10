class Option < ApplicationRecord

	belongs_to :photo, optional: true

	has_many :requests, dependent: :destroy
	has_many :photos, through: :requests, dependent: :destroy
end
