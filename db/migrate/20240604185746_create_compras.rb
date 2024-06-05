class CreateCompras < ActiveRecord::Migration[7.1]
  def change
    create_table :compras do |t|
      t.float :valor_total, precision: 15, scale: 2, default: 0

      t.timestamps
    end
  end
end
