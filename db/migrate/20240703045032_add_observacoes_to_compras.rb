class AddObservacoesToCompras < ActiveRecord::Migration[7.1]
  def change
    add_column :compras, :observacoes, :text
  end
end
