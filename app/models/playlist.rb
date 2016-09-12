class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
  acts_as_likeable
  validates_presence_of :user
end
