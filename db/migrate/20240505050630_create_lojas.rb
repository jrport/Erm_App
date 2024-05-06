class CreateLojas < ActiveRecord::Migration[7.1]
  def change
    create_table :lojas do |t|
      t.string :nome
      t.string :email
      t.string :telefone

      t.timestamps
    end
  end
end
