class Song < ActiveRecord::Base
	belongs_to :album

	def liked!
		num = self.likes
		num += 1
		self.update likes: num
	end
end
