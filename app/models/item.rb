class Item < ApplicationRecord
  belongs_to :pedido, optional: true
  belongs_to :compra, optional: true
end
