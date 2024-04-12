class CreateCompras < ActiveRecord::Migration[7.1]
  def change
    create_table :compras do |t|
      t.float :valor

      t.timestamps
    end
  end
end
