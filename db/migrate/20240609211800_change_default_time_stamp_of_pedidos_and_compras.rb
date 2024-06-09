class ChangeDefaultTimeStampOfPedidosAndCompras < ActiveRecord::Migration[7.1]
  def change
        change_column_default :pedidos, :data_do_pedido, -> { 'CURRENT_TIMESTAMP' }
        change_column_default :compras, :data_do_compra, -> { 'CURRENT_TIMESTAMP' }
  end
end
