class CreateComprasItems < ActiveRecord::Migration[7.1]
  def change
    create_table :compras do |t|
      t.float :valor_total, precision: 15, scale: 2, default: 0

      t.timestamps
    end
    create_table :items do |t|
      t.string :nome, null: false
      t.string :porcao, null: false, default: 'unitario'
      t.integer :quantidade, null: false, default: 1
      t.string :observacoes, null: true

      t.references :compras, foreign_key: true, null: true
      t.references :pedidos, foreign_key: true, null: true
    end
  end
end
