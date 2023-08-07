class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :description, null: false
      t.boolean :pending, null: false, default: true

      t.references :todo_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
