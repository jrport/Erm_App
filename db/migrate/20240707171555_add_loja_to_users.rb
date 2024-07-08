class AddLojaToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :loja, null: false, foreign_key: true
  end
end
