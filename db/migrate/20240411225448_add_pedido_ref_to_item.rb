class AddPedidoRefToItem < ActiveRecord::Migration[7.1]
  def change
    add_reference :items, :pedido, null: true, foreign_key: true
  end
end
