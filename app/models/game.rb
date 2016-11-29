class Game < ApplicationRecord
	validates :date, presence: true
	belongs_to :home, class_name: "Team"
	belongs_to :guest, class_name: "Team"
end
