class User < ApplicationRecord
	has_secure_password
	
	has_many :activities
	has_many :entries

	validates :name, length: { minimum: 2 }
	validates :email,	presence: true, 
										uniqueness: true,
										format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :password, length: { minimum: 6 }

	before_save do
		self.email.downcase!
		self.name.capitalize!
	end
end
