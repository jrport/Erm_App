class CreateItemsDePedidos < ActiveRecord::Migration[7.1]
  def change
    create_table :items_de_pedidos do |t|
      t.string :nome, null: false
      t.string :porcao, null: false, default: 'unitario'
      t.integer :quantidade, null: false, default: 1
      t.string :observacoes, null: true

      t.references :pedido, foreign_key: true, null: false

      t.timestamps
    end
  end
end
