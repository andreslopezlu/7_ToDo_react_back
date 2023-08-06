class CreateTodoLists < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_lists do |t|
      t.string :title, null: false

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
