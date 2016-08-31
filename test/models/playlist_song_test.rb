require "test_helper"

describe PlaylistSong do
  let(:playlist_song) { PlaylistSong.new }

  it "must be valid" do
    value(playlist_song).must_be :valid?
  end
end
