class ItemsDeCompra < ApplicationRecord
  belongs_to :compra, optional: true
  belongs_to :loja, optional: false

  enum :estado, { muito_ruim: 'muito_ruim', ruim: 'ruim', ok: 'ok' }
end
