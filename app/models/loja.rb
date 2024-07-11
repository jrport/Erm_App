class Loja < ApplicationRecord
  has_many :items_de_compra
  has_many :transferencias
  validates :nome, presence: true, length: { minimum: 3, message: 'name deve ter no mínimo 3 caracteres' }

  def self.ransackable_attributes(_auth_object = nil)
    %w[id id_value nome]
  end
end
