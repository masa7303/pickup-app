class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :shop, foreign_key: true, null: false

      t.timestamps
    end
    add_index :likes, [:shop_id, :user_id], unique: true
  end
end
