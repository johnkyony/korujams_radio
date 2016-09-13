class Song < ActiveRecord::Base 
  validates_uniqueness_of  :api_id
  validates_presence_of :api_id
  validates_presence_of :art_work
  validates_uniqueness_of  :source_url
  validates_presence_of :title 
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  scope :starts_with, -> (title) { where("title like ?", "%#{title}%")}
  def self.save_data_from_api(blog)
    offset = 0
    client = Tumblr::Client.new :consumer_key => 'SC33bEI1MgbSTpMgI9ORph6mezAaTCm1uMYG81iOUNWJ4CMJ9f'
    iresult = client.posts "#{blog}", :type => 'audio', :filter => 'raw'
    total_post = iresult["total_posts"]/20
    total_post.times do |i|

      result = client.posts "#{blog}", :type => 'audio', :filter => 'raw',:offset => offset += 20
      feed_data = result["posts"]
      total_post = result["total_posts"]/20
      songs = feed_data.map do |post|
        song = Song.new
        song.api_id = post["id"]
        song.art_work = post["album_art"]
        if post["album_art"].blank?
          song.source_url = post["source_url"]
        else
          song.source_url = post["audio_url"]
        end
        if post["song_name"].blank?
          song.title =  post["summary"]
        else
          song.title = post["song_name"]
        end
        # set name value however you want to do that
        song.save
        song
      end 
    
    end 
    
  end






  def self.update_data_from_api
    client = Tumblr::Client.new :consumer_key => 'SC33bEI1MgbSTpMgI9ORph6mezAaTCm1uMYG81iOUNWJ4CMJ9f'
    result = client.posts 'thedigitaltraphouse2.tumblr.com', :type => 'audio', :filter => 'raw'
    feed_data = result["posts"]
    total_post = result["total_posts"]/20
    songs = feed_data.map do |post|
      song = Song.new
      song.api_id = post["id"]
      song.art_work = post["album_art"]
      if post["album_art"].blank?
        song.source_url = post["source_url"]
      else
        song.source_url = post["audio_url"]
      end
      if post["song_name"].blank?
        song.title =  post["summary"]
      else
        song.title = post["song_name"]
      end
      # set name value however you want to do that
      song.save
      song
    end     
  end
end
