class WelcomeController < ApplicationController
	def index
		@artists = Artist.all.order(:likes).reverse_order
		@albums = Album.all.order(:likes).reverse_order
		@songs = Song.all.order(:likes).reverse_order	
	end
end
