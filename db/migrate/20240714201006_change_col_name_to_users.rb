class ChangeColNameToUsers < ActiveRecord::Migration[7.1]
  def change
    # chagne column name from undeletable to deletable
    rename_column :users, :undeletable, :deletable
  end
end
