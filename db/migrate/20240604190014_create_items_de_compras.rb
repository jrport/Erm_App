class CreateItemsDeCompras < ActiveRecord::Migration[7.1]
  def change
    create_enum :estado, %w[muito_ruim ruim ok]

    create_table :items_de_compras do |t|
      t.string :nome, null: false
      t.string :observacoes, null: true
      t.integer :quantidade, null: false, default: 1
      t.enum :estado, enum_type: 'estado', default: 'ok', null: false
      t.float :preco, null: true

      t.references :loja, foreign_key: true, null: false
      t.references :compra, foreign_key: true, null: false

      t.timestamps
    end
  end
end
