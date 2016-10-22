class Photo < ApplicationRecord
	validates_presence_of :img

	has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

	belongs_to :asker, optional: true

	has_one  :note, dependent: :destroy
	has_many :requests, dependent: :destroy
	has_many :options, through: :requests, dependent: :destroy

	delegate :email, :id, :note, to: :asker, prefix: true, allow_nil: true

	# def asker_email
	# 	if self.asker.present?
	# 		self.asker.email
	# 	else
	# 		"-"
	# 	end
	# end

	# def asker_note
	# 	if self.asker.present?
	# 		self.asker.note
	# 	else
	# 		"-"
	# 	end
	# end

	def note_content
		if self.note.present?
			self.note.content
		else
			"-"
		end
	end

end
