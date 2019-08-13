class CreateUploadArts < ActiveRecord::Migration[5.2]
  def change
    create_table :upload_arts do |t|
      t.text :title
      t.text :description
      t.date :date
      t.numeric :start_bid
      t.string :image
      t.references :artist

      t.timestamps
    end
  end
end
