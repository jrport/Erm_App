class CreateCompras < ActiveRecord::Migration[7.1]
  def change
    create_table :compras do |t|
      t.float :valor_total

      t.timestamps
    end
  end
end
