class Entry < ApplicationRecord
	belongs_to :activity

	validates :activity_id, presence: true
	validates :date, presence: true,
									 uniqueness: { scope: :activity_id }
	validate :date_cannot_be_in_future
	validates :units, { presence: true, numericality: true }

	def date_cannot_be_in_future
		if date > Date.today
			errors.add(:date, "entries can't be made for future dates")
		end
	end
end

