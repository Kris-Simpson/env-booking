class AddFromAndToToBookedEnvironments < ActiveRecord::Migration[5.2]
  def change
    add_column :booked_environments, :from, :datetime, null: false
    add_column :booked_environments, :to, :datetime, null: false
  end
end
