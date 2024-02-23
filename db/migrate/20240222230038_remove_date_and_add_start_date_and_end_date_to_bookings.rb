class RemoveDateAndAddStartDateAndEndDateToBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :date, :date
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
  end
end
