class AddDataDaCompra < ActiveRecord::Migration[7.1]
  def change
    add_column :items_de_compras, :data_da_compra, :datetime, null: false
    rename_column :compras, :data_do_compra, :data_da_compra
  end
end
