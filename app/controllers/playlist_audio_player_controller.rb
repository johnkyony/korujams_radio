class PlaylistAudioPlayerController < ApplicationController
  def index
    @tracks = PlaylistSong.where(:playlist_id => params[:playlist_id])
  end
end
