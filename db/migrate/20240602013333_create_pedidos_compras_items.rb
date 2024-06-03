class CreatePedidosComprasItems < ActiveRecord::Migration[7.1]
  def change
    create_enum :status, %w[pending in_progress finished]

    create_table :pedidos do |t|
      t.references :loja, foreign_key: true, null: false
      t.enum :status, enum_type: 'status', default: 'pending', null: false

      t.timestamps
    end
  end
end
