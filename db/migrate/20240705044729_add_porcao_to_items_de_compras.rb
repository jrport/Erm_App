class AddPorcaoToItemsDeCompras < ActiveRecord::Migration[7.1]
  def change
    add_column :items_de_compras, :porcao, :string, null: false, default: 'unidade'
  end
end
