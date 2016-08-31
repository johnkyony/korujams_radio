class AudioPlayerController < ApplicationController
  def index
    @track = Song.find(params[:song_id])
  end
end
