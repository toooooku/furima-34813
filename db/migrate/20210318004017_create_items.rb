class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,         null:false
      t.integer :price,       null:false
      t.text :decription,     null:false
      t.integer :category,    null:false
      t.integer :status,      null:false
      t.integer :cost,        null:false
      t.integer :day,         null:false
      t.integer :prefecture,  null:false
      t.integer :user,        null:false, foreign_key: true
      t.timestamps
    end
  end
end
