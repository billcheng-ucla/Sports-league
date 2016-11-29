class Team < ApplicationRecord
	belongs_to :league, optional: true
	belongs_to :manager, class_name: "User", optional: true
	has_many :events, dependent: :destroy
	has_many :games, foreign_key: "guest_id"
	has_many :games, foreign_key: "home_id", dependent: :destroy
	#validates :user, exclusion: {in: [nil]}
	validates :team_name, uniqueness: true
	validates :tag, uniqueness: true, presence: true
  has_attached_file :pic
  has_attached_file :symbol
  validates_attachment :pic, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, size: { in: 0..500.kilobytes }
  validates_attachment :symbol, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, size: { in: 0..500.kilobytes }
end
