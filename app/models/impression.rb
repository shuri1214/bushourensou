class Impression < ApplicationRecord
  belongs_to :bushou
	validates :bushou_id, presence: true
	validates :keyword, presence: true, length:{ maximum:  255 } , uniqueness: { scope: [:bushou_id]  }

end
