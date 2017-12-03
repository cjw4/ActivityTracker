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

	def self.to_csv
		attributes = %w{date amount}
		CSV.generate(headers: true) do |csv|
			csv << attributes

			all.each do |entry|
				csv << entry.attributes.values_at("date", "units")
			end
		end
	end
end

