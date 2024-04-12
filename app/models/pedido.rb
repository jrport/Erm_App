class Pedido < ApplicationRecord
  has_many :items
  belongs_to :loja
end
