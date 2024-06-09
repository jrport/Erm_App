class AddColumnDataDoPedidoToPedidos < ActiveRecord::Migration[7.1]
  def change
    add_column :pedidos, :data_do_pedido, :datetime, default: Time.now
  end
end
