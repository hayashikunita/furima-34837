class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,         null: false
      t.integer :address1_id,        null: false
      t.string :shikucyouson,        null: false
      t.string :bannchi,             null: false
      t.string :tatemonomei,
      t.string :phone_number,        null: false
      t.references :purchase,        foreign_key: true
      t.timestamps
    end
  end
end