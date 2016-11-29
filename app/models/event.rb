class Event < ApplicationRecord
	validates :date, presence: true
	belongs_to :team
end
