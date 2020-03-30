class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body
      t.references :user, foreign_key: true, null: false
      t.references :shop, foreign_key: true, null: false

      t.timestamps
    end
    add_index :reviews, [:user_id, :shop_id], unique: true
  end
end
