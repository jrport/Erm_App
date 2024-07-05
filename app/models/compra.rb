class Compra < ApplicationRecord
  has_many_attached :notas
  has_many :items_de_compras, dependent: :destroy, validate: true, class_name: 'ItemsDeCompra'
  accepts_nested_attributes_for :items_de_compras, allow_destroy: true
  validate :one_item_at_least?

  def self.cost_per_month
    compras_recentes.transform_values do |compra|
      compra.reduce(0) { |soma_dos_valores, valor_da_compra| soma_dos_valores + valor_da_compra.valor_total }
    end
  end

  def self.qtd_per_month
    compras_recentes.transform_values(&:count)
  end

  def self.compras_recentes
    Compra.where(data_da_compra: 12.months.ago..Date.today)
          .group_by { |compra| compra.data_da_compra.month }
          .transform_keys { |month| I18n.t('date.month_names')[month].capitalize }
  end

  def self.this_month
    Compra.where(data_da_compra: Date.today.beginning_of_month..Date.today.end_of_month)
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[data_da_compra id id_value valor_total]
  end

  def one_nota_at_least?
    !notas.empty?
  end

  private

  def one_item_at_least?
    errors.add(:items, 'Necessário ao menos um item!') if items_de_compras.empty?
  end
end
