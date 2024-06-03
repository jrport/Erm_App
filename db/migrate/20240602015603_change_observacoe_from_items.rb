class ChangeObservacoeFromItems < ActiveRecord::Migration[7.1]
  def change
    change_column :items, :observacoes, :text
  end
end
