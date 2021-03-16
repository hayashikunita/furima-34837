class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :price,                null: false
      t.string :item,                  null: false
      t.text :explanation,             null: false
      t.integer :category_id,          null: false
      t.integer :status_id,            null: false
      t.integer :fee_id,               null: false
      t.integer :address1_id,          null: false
      t.integer :day_id,     null: false
      t.references :user,              null: false, foreign_key: true 
      # userのreferenceはこの記述になる。
      t.timestamps
    end
  end
end
