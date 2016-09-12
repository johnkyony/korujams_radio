class PlaylistSongsController < ApplicationController
  def index
    @playlist_songs = PlaylistSong.where(:playlist_id => params[:playlist_id])


  end

  def new
    @feed = Song.order('RANDOM()').paginate(page: params[:page], per_page: 15)
    @playlist_song = PlaylistSong.new
  end
  def create
    @playlist_song = PlaylistSong.new
    @playlist_song.playlist_id = params[:playlist_id]
    @playlist_song.song_id = params[:song_id]
    @playlist_song.save
    if @playlist_song.save
      flash[:notice] = "This song has been saved to the playlist"
      redirect_to :back
      
    else
      flash[:succes] = "Please retry again"
      render 'new'
    end
    
  end

  def show
  end
   def delete
    @playlist_song.song_id = PlaylistSong.find(params[:song_id])
  end
  def destroy    
    
    @playlist_song = PlaylistSong.find(:id => params[:id])
    @playlist_song.destroy   
    redirect_to :back
  end

  private
  def playlist_songs_params
    params.require(:playlistSong).permit(:playlist_id , :song_id)
  end
end
