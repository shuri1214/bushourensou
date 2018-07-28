class Bushou < ApplicationRecord
	validates :name, presence: true, length: { maximum: 255 },uniqueness: true
	has_many :impressions
end
