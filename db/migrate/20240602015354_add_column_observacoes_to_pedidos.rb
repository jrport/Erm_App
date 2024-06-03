class AddColumnObservacoesToPedidos < ActiveRecord::Migration[7.1]
  def change
    change_table :pedidos do |t|
      t.text :observacoes, null: true
    end
  end
end
