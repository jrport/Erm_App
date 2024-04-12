class CreatePedidos < ActiveRecord::Migration[7.1]
  def change
    create_table :pedidos do |t|
      t.boolean :estado

      t.timestamps
    end
  end
end
