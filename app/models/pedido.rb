class Pedido < ApplicationRecord
  belongs_to :loja
  has_many :items_de_pedidos

  accepts_nested_attributes_for :items_de_pedidos,
                                reject_if: lambda { |attributes|
                                             attributes['nome'].blank? ||
                                               attributes['quantidade'].blank? ||
                                               attributes['porcao'].blank?
                                           }

  enum :status, { pending: 'pending', in_progress: 'in_progress', finished: 'finished' }
  validates :data_do_pedido, presence: {message: 'O campo Data é obrigatória'}
  validates :loja_id, presence: {message:"O campo Loja é obrigatória"}, inclusion: { in: Loja.pluck(:id).uniq, message: 'Loja é obrigatória'}
  validates :observacoes, length: {maximum: 200, message: 'Máximo de 200 caractéres' }

  def loja_options
    Loja.pluck(:nome, :id).to_h.map { |nome, id| [nome, id] }
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[data_do_pedido loja_id status updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[loja]
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
