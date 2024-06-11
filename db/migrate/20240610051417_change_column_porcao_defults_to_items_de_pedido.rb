class ChangeColumnPorcaoDefultsToItemsDePedido < ActiveRecord::Migration[7.1]
  def change
    change_column_default :items_de_pedidos, :porcao, 'Unitário'
  end
end
