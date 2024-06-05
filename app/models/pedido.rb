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

  def loja_options
    Loja.pluck(:nome, :id).to_h.map { |nome, id| [nome, id] }
  end

  # def items_de_pedidos_attributes=(items_de_pedidos_attributes)
  #   items_de_pedidos_attributes.each do |i, items_de_pedidos_attributes|
  #     self.items.build(items_de_pedidos_attributes)
  #   end
  # end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at loja_id status updated_at]
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
