class UpdateTimes < ActiveRecord::Migration[7.0]
  def change
    change_column :flights, :departure_time, :time
    add_column :flights, :departure_date, :date
  end
end
