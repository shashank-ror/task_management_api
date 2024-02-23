class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.string :status, default: 'Created'
      t.date :completed_date
      t.string :priority, default: 'Medium'
      t.integer :assigned_to
      t.string :assigned_by, default: 'Admin'

      t.timestamps
    end
  end
end
