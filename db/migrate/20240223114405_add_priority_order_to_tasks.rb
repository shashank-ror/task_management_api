class AddPriorityOrderToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :priority_order, :integer
  end
end
