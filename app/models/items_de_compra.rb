class ItemsDeCompra < ApplicationRecord
  belongs_to :compra
  belongs_to :loja
  has_many :transferencias, class_name: 'Transferencia', foreign_key: 'item_id', dependent: :destroy

  after_update :create_transferencia, if: :saved_change_to_loja_id?
  after_create :create_transferencia

  validates :nome, presence: true, length: { minimun: 1, maximum: 255 }

  def create_transferencia
    origem_id = loja_id_was || nil
    Transferencia.create(origem_id:, destino_id: loja_id, item: self)
  end

  enum :estado, { muito_ruim: 'muito_ruim', ruim: 'ruim', ok: 'ok' }

  def self.ransackable_attributes(_auth_object = nil)
    %w[compra_id created_at data_da_compra estado id id_value loja_id nome observacoes preco
       quantidade updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[compra loja]
  end

  def pretty_estado
    estados = { muito_ruim: 'Crítico', ruim: 'Desgastado', ok: 'Conservado' }
    estados[estado.to_sym]
  end

end
