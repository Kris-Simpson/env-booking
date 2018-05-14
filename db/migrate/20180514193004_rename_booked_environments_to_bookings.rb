class RenameBookedEnvironmentsToBookings < ActiveRecord::Migration[5.2]
  def change
    rename_table :booked_environments, :bookings
  end
end
