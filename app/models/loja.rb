class Loja < ApplicationRecord
  has_many :items_de_compra
  has_many :transferencias
  def self.ransackable_attributes(auth_object = nil)
    [ "id", "id_value", "nome" ]
  end
end
