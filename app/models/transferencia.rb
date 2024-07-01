class Transferencia < ApplicationRecord
  self.table_name = 'transferencias'

  belongs_to :origem, class_name: 'Loja', foreign_key: 'origem_id'
  belongs_to :destino, class_name: 'Loja', foreign_key: 'destino_id'
  belongs_to :item, class_name: 'ItemsDeCompra', foreign_key: 'item_id'
end
