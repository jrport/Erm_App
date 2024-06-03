class Loja < ApplicationRecord
  has_many :pedidos
  has_many :items

  def self.ransackable_attributes(_auth_object = nil)
    %w[nome]
  end
end
