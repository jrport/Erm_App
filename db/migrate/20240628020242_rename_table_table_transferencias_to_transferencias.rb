class RenameTableTableTransferenciasToTransferencias < ActiveRecord::Migration[7.1]
  def change
    rename_table('table_transferencias', 'transferencias')
  end
end
