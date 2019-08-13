class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|
      t.string :buyer_first_name
      t.string :buyer_last_name
      t.string :buyer_email
      t.string :buyer_phone_number
      t.timestamps
    end
  end
end
