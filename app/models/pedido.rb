class Pedido < ApplicationRecord
  has_many :items_de_pedidos, dependent: :destroy, validate: true, class_name: 'ItemsDePedido'
  belongs_to :loja

  accepts_nested_attributes_for :items_de_pedidos, allow_destroy: true

  validates_presence_of :loja_id, :data_do_pedido, message: 'Campo obrigatório'
  # validate :must_have_at_least_one_item

  enum :status, { pending: 'pending', in_progress: 'in_progress', finished: 'finished' }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at data_do_pedido id id_value loja_id observacoes status updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['loja']
  end

  def self.lojista(session_id)
    Pedido.where(loja_id: session_id)
  end

  private

  def must_have_at_least_one_item
    return unless items_de_pedidos.empty?

    errors.add(:base, 'Um pedido deve possuir ao menos um item listado')
  end
end
