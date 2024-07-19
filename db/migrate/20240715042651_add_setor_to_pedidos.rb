class AddSetorToPedidos < ActiveRecord::Migration[7.1]
  def change
    add_column :pedidos, :setor, :string, default: 'Geral'
  end
end
