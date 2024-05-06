class CreatePedidos < ActiveRecord::Migration[7.1]
  def change
    create_table :pedidos do |t|
      t.string :status
      t.references :loja, null: false, foreign_key: true

      t.timestamps
    end
  end
end
