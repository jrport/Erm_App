class AddSudoAndSuperToUsers < ActiveRecord::Migration[7.1]
  def change
    # Add sudo column of bool type to users table
    add_column :users, :undeletable, :boolean, default: false
    add_column :users, :dev, :boolean, default: false
  end
end
