class RemoveUserAndPayPeriodFromIntervals < ActiveRecord::Migration[7.0]
  def change
    remove_column :intervals, :user, :integer
    remove_column :intervals, :pay_period, :integer
  end
end
