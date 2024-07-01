class CreateTableTransferencias < ActiveRecord::Migration[7.1]
  def change
    create_table :table_transferencias do |t|
      t.references :origem, null: false, foreign_key: { to_table: :lojas }
      t.references :destino, null: false, foreign_key: { to_table: :lojas }
      t.references :item, null: false, foreign_key: { to_table: :items_de_compras }

      t.timestamps
    end
  end
end
