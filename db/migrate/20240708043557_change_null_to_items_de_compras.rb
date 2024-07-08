class ChangeNullToItemsDeCompras < ActiveRecord::Migration[7.1]
  def change
    change_column_null :items_de_compras, :compra_id, false
  end
end
