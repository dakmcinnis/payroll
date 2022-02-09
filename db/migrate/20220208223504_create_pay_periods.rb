class CreatePayPeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :pay_periods do |t|
      t.date :start
      t.date :end
      t.date :call

      t.timestamps
    end
  end
end
