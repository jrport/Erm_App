class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :nome
      t.integer :quantidade

      t.timestamps
    end
  end
end
