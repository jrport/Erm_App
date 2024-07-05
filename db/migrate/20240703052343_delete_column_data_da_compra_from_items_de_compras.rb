class DeleteColumnDataDaCompraFromItemsDeCompras < ActiveRecord::Migration[7.1]
  def change
    remove_column :items_de_compras, :data_da_compra
  end
end
