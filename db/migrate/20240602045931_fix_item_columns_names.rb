class FixItemColumnsNames < ActiveRecord::Migration[7.1]
  def change
    rename_column :items, :compras_id, :compra_id
    rename_column :items, :pedidos_id, :pedido_id
  end
end
