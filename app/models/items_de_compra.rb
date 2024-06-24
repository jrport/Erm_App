class ItemsDeCompra < ApplicationRecord
  belongs_to :compra
  belongs_to :loja

  enum :estado, { muito_ruim: 'muito_ruim', ruim: 'ruim', ok: 'ok' }

  def self.ransackable_attributes(_auth_object = nil)
    %w[compra_id created_at data_da_compra estado id id_value loja_id nome observacoes preco
       quantidade updated_at]
  end
end
