class Photo < ApplicationRecord
	validates_presence_of :img

	has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

	belongs_to :asker, optional: true

	has_many :request_items, dependent: :destroy
	has_many :items, through: :request_items, dependent: :destroy



end
