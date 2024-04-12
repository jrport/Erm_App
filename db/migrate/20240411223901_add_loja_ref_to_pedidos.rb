class AddLojaRefToPedidos < ActiveRecord::Migration[7.1]
  def change
    add_reference :pedidos, :loja, null: false, foreign_key: true
  end
end
