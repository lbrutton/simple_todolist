class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.belongs_to :user, index: true
      t.belongs_to :todo_list, index: true
      t.date :due_date
      t.string :title
      t.text :description
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
