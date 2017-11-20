class Entry < ApplicationRecord
	belongs_to :activity

	validates :activity_id, presence: true
	validates :date, presence: true
	validates :units, { presence: true, numericality: true }
end

