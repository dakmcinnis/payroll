class CreateTimesheets < ActiveRecord::Migration[7.0]
  def change
    create_table :timesheets do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :pay_period, null: false, foreign_key: true

      t.timestamps
    end
  end
end
