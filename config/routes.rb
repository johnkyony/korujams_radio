Rails.application.routes.draw do
  get 'playlist_audio_player/index'

  get 'playlist_songs/index'

  get 'playlist_songs/new'

  get 'playlist_songs/show'

  get 'playlists/index'

  get 'playlists/new'

  get 'audio_player/index'

  get 'feed/index'

  devise_for :users
  resources :playlist_audio_player
  resources :users
  resources :playlists
  resources :songs
  resources :playlist_songs do
    get "delete"
  end
  
  resources :playlist do 
    resources :playlist_songs    
  end
  resources :playlist do 
    resources :songs do 
      resources :playlist_songs
    end
  end
  
  resources :playlist do 
    resources :playlist_audio_player
  end
  resources :songs do 
    resources :audio_player
  end
  root to: 'feed#index'
end
