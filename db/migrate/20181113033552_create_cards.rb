class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.date :due_date
      t.references :column, foreign_key: true

      t.timestamps
    end
  end
end
