class Pedido < ApplicationRecord
  belongs_to :loja
  has_many :items_de_pedidos, dependent: :destroy, validate: true

  accepts_nested_attributes_for :items_de_pedidos, reject_if: :all_blank, allow_destroy: true

  enum :status, { pending: 'pending', in_progress: 'in_progress', finished: 'finished' }

  validates_presence_of :loja_id, :data_do_pedido, message: 'Campo obrigatório'
  validates_inclusion_of :loja_id, in: Loja.pluck(:id).uniq

  validate :must_have_at_least_one_item

  def loja_options
    Loja.pluck(:nome, :id).to_h.map { |nome, id| [nome, id] }
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[data_do_pedido loja_id status updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[loja]
  end

  private

  def must_have_at_least_one_item
    if items_de_pedidos.empty?
      errors.add(:base, "Um pedido deve possuir ao menos um item listado")
    end
  end

  # after_update_commit lambda {
  #                       broadcast_update_to 'pedidos', partial: 'pedidos/stats_counter',
  #                                                      locals: { open_count: Pedido.pending.count, finished_count: Pedido.finished.count },
  #                                                      target: 'open_count'
  #                     }
  # after_update_commit :broadcast_new_count
  #
  # def broadcast_new_count
  #   ActionCable.server.broadcast('pedidos_channel', rendered_count)
  # end
  #
  # def rendered_count
  #   ApplicationController.renderer.render(
  #     render turbo_stream: turbo_stream.update('finished_counter', 'dadw')
  #   )
  # end
end
