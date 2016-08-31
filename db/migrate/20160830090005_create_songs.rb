class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :api_id
      t.string :art_work
      t.string :source_url
      t.string :title

      t.timestamps null: false
    end
  end
end
