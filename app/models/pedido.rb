class Pedido < ApplicationRecord
  belongs_to :loja
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "loja_id", "status", "updated_at"]
  end
end
