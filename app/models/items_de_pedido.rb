class ItemsDePedido < ApplicationRecord
  belongs_to :pedido

  validates_presence_of :quantidade, :porcao, :nome, message: 'não pode ser deixado em branco'
end
