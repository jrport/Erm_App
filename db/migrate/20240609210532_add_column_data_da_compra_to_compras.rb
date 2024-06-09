class AddColumnDataDaCompraToCompras < ActiveRecord::Migration[7.1]
  def change
    add_column :compras, :data_do_compra, :datetime, default: 'CURRENT_TIMESTAMP'
  end
end
