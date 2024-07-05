class ChangePorcaoDefaultInItemsDeCompras < ActiveRecord::Migration[7.1]
  def change
    change_column_default :items_de_compras, :porcao, "Unidade"
  end
end
