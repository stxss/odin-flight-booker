class AddDataToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :flight_id, :integer, foreign_key: true
    add_column :bookings, :passenger_id, :integer, foreign_key: true
  end
end
