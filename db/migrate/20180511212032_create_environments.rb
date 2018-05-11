class CreateEnvironments < ActiveRecord::Migration[5.2]
  def change
    create_table :environments do |t|
      t.string :name
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
