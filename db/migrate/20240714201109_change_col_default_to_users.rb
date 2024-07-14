class ChangeColDefaultToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :deletable, from: false, to: true
  end
end
