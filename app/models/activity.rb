class Activity < ApplicationRecord
  belongs_to :user

	has_many :entries, dependent: :destroy

	validates :user_id, presence: true
	
	validates :name,	presence: :true,
										uniqueness: { scope: :user,
																	case_sensitive: false } 
	validates :units, presence: true

	before_save { self.name.capitalize! }
end
