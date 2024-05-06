class AddColumnLojaToItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :items, :loja, null: true, foreign_key: true
  end
end
