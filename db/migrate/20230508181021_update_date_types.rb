class UpdateDateTypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :departure_time
    add_column :flights, :departure_time, :datetime
  end
end
