require "test_helper"

feature "UserCanPlayMusic" do
  let(:john) { users(:john)  }
  let(:one) {playlists(:one)}
   before do
    sign_in_as john

  end
  scenario "User can see published playlist" do
    visit root_path
    within "#playlist" do 
      assert_content one.playlist_cover
      assert_content one.name
      assert_equal one.publish , true
    end

    
  end
end
