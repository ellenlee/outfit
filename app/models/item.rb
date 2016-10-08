class Item < ApplicationRecord
	has_many :request_items, dependent: :destroy
	has_many :photos, through: :request_items, dependent: :destroy

end
