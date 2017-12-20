class User < ApplicationRecord
	has_secure_password
	
	has_many :activities, dependent: :destroy

	validates :name, length: { minimum: 2 }
	validates :email,	presence: true, 
										uniqueness: true,
										format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :password, length: { minimum: 6 }

	before_save do
		self.email.downcase!
		self.name.capitalize!
	end

	def self.create_new_activity
		user = self.first
		name = Time.now.to_s
		user.activities.create(name: name, units: 'none')
	end
end
