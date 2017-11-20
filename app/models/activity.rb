class Activity < ApplicationRecord
  belongs_to :user
	has_many :entries
	validates :user_id, presence: :true
	validates :name, presence: :true
	validates :units, presence: :true
end
