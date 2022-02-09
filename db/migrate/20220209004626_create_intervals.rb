class CreateIntervals < ActiveRecord::Migration[7.0]
  def change
    create_table :intervals do |t|
      t.integer :user
      t.integer :pay_period
      t.date :date
      t.time :time_in
      t.time :time_out

      t.timestamps
    end
  end
end
