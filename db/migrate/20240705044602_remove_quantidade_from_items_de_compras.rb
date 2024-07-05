class RemoveQuantidadeFromItemsDeCompras < ActiveRecord::Migration[7.1]
  def change
    remove_column :items_de_compras, :quantidade, :integer
  end
end
