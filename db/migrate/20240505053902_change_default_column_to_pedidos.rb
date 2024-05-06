class ChangeDefaultColumnToPedidos < ActiveRecord::Migration[7.1]
  def change
    change_column_default :pedidos, :status, from: nil, to: "Pendente"
    change_column_default :compras, :valor_total, from: nil, to: 0.0
  end
end
