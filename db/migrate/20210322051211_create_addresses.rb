class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,         presence: true
      t.integer :address1_id,        presence: true
      t.string :shikucyouson,        presence: true
      t.string :bannchi,            presence: true
      t.string :tatemonomei,         presence: true
      t.string :phone_number,        presence: true
      t.references :purchase,      foreign_key: true
      t.timestamps
    end
  end
end