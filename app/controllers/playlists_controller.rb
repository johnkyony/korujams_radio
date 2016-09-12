class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.where(:user_id => current_user.id)
  end

  def new 
    @playlist = Playlist.new
  end
  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id  
    if @playlist.save
      flash[:notice] = "The playlist was saved"

    else
     flash[:succes] = "The playlist was not saved"
    end
    
  end
  def show
    @feed = Song.order('RANDOM()').paginate(page: params[:page], per_page: 21)
    @playlist = Playlist.find(params[:id])
  end
  def edit
    @playlist = Playlist.find(params[:id])
  end

 def update
  @playlist = Playlist.find(params[:id])
  if @playlist.user_id == current_user.id
    @playlist.update(playlist_params)
  if @playlist.save
    flash[:notice] = "The playlist was successfully updated"
    render 'save'
  else
    render 'edit'
    flash[:success] = "Something that went wrong please try again"
  end
    
  else
     flash[:success] = "Sorry you're not the host of the party"
     redirect_to party_path(params[:id])

  end
  

 end
   private
  # Use callbacks to share common setup or constraints between actions.
  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def playlist_params
    params.require(:playlist).permit(:name,:user_id,:playlist_cover,:publish)
  end
end
