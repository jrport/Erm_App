class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :nome
      t.integer :quantidade
      t.text :descricao, null: true
      t.references :pedido, null: true, foreign_key: true
      t.references :compra, null: true, foreign_key: true
      t.float :valor, null: true

      t.timestamps
    end
  end
end
