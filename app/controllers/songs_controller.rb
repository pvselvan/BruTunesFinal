class SongsController < ApplicationController

	def index
		@songs = Song.all.order(:name)
	end

	def show
		@song = Song.find(params[:id])
	end

	def new
		@song = Song.new
		@album = Album.find(params[:album_id])
	end

	def create
		@album = Album.find(params[:album_id])

		@song = @album.songs.create(song_params)
		if @song.save
			redirect_to song_path(@song)
            # if anything went wrong, if may be caused by 'album_path'
		else
			render 'new'
		end
	end


	def edit
		@album = Album.find(params[:album_id])
		@song = @album.songs.find(params[:id])
	end

	def update
		
		@song = Song.find(params[:id])
		@album = Album.find(@song.album_id)

		if @song.save
        	redirect_to album_song_path
		else
        	render 'edit'
		end
	end

    def destroy
    	@song = Song.find(params[:id])
		@song.destroy
 		redirect_to songs_path
    end

    def like
		@song = Song.find(params[:id])
		@song.liked!
		redirect_to @song
	end

    private
    	def song_params
			params.require(:song).permit(:name, :time)
		end
end
