class PlaylistSong < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :song
  validates_presence_of :playlist
  validates_presence_of :song
  validates_uniqueness_of :song
end
