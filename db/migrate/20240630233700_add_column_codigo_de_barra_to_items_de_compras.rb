class AddColumnCodigoDeBarraToItemsDeCompras < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'uuid-ossp'
    add_column :items_de_compras, :codigo_de_barra, :uuid, default: -> { 'uuid_generate_v4()' }
  end
end
