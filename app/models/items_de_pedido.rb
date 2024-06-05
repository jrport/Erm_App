class ItemsDePedido < ApplicationRecord
  belongs_to :pedido, optional: true
end
