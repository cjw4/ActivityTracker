class Entry < ApplicationRecord
	belongs_to :activity
	validates :date, presence: true
	validates :units, { presence: true, numericality: true }
end

