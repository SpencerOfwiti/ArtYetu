class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :artist_first_name
      t.string :artist_last_name
      t.string :artist_email
      t.string :artist_phone_number
      t.timestamps
    end
  end
end
