class Album < ActiveRecord::Base
	belongs_to :artist
	has_many :songs, dependent: :destroy

  	def liked!
		num = self.likes
		num += 1
		self.update likes: num
	end
end
