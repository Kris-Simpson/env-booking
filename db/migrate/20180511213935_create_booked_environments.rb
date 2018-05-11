class CreateBookedEnvironments < ActiveRecord::Migration[5.2]
  def change
    create_table :booked_environments do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :environment, foreign_key: true

      t.timestamps
    end
  end
end
