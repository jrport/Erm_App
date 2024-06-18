class ItemsDeCompra < ApplicationRecord
  belongs_to :compra, optional: true
  belongs_to :loja, optional: false

  enum :estado, { muito_ruim: 'muito_ruim', ruim: 'ruim', ok: 'ok' }
  

  def self.ransackable_attributes(auth_object = nil)
    ["compra_id", "created_at", "estado", "id", "id_value", "loja_id", "nome", "observacoes", "preco", "quantidade", "updated_at"]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[loja, compra]
  end
end
