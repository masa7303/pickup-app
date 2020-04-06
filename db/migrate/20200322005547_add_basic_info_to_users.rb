class AddBasicInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :prefecture, :string, null: false
    add_column :users, :municipality, :string, null: false
    add_column :users, :role, :integer, null: false, default: 0
    add_column :users, :image, :string
  end
end
