class AddLojaColumnToItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :items, :loja
  end
end
