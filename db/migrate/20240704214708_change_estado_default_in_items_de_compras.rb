class ChangeEstadoDefaultInItemsDeCompras < ActiveRecord::Migration[7.1]
  def change
    change_column_default :items_de_compras, :estado, 'ok'
  end
end
