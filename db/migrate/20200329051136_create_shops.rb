class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :prefecture
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
