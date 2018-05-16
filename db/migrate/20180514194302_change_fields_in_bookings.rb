class ChangeFieldsInBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :duration, :integer, null: false, default: 1
    add_column :bookings, :until, :datetime, null: false

    remove_column :bookings, :from, :datetime
    remove_column :bookings, :to, :datetime
  end
end
