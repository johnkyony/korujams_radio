class PlaylistAudioPlayerController < ApplicationController
  def index
    @tracks = PlaylistSong.where(params[:playlist_id])
  end
end
