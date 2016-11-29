class User < ApplicationRecord
	has_secure_password
	has_one :league
	has_one :team, foreign_key: "manager_id"
	has_attached_file :symbol, styles: {thumb: "100x100>"}
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true
	validates :role, presence: true, inclusion: { in: %w(Commissioner Manager Athlete), message: "Please select your job"}
	def self.confirm (username, password)
		user = User.find_by(username: username)
		user.authenticate(password)
	end
end
