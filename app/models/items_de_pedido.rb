class ItemsDePedido < ApplicationRecord
  belongs_to :pedido

  validates_presence_of :nome, :quantidade, :porcao
end
