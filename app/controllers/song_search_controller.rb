class SongSearchController < ApplicationController
  def index
    @results = Song.starts_with(params[:search])

  end
end
