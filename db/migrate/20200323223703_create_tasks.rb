class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :section, null: false
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
