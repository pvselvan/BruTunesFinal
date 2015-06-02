class Artist < ActiveRecord::Base
	has_many :albums, dependent: :destroy
	has_many :songs, through: :albums

	
	validates :name, presence: true

	def liked!
		num = self.likes
		num += 1
		self.update likes: num
	end
end
