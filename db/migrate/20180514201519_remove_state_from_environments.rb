class RemoveStateFromEnvironments < ActiveRecord::Migration[5.2]
  def change
    remove_column :environments, :state, :integer
  end
end
