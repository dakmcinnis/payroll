class AddTimesheetToInterval < ActiveRecord::Migration[7.0]
  def change
    add_reference :intervals, :timesheet, null: false, foreign_key: true
  end
end
