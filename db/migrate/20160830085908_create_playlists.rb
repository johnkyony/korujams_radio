class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :playlist_cover
      t.boolean :publish

      t.timestamps null: false
    end
  end
end
