class Pedido < ApplicationRecord
  belongs_to :loja
  has_many :items

  enum :status, { pending: 'pending', in_progress: 'in_progress', finished: 'finished' }

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
end
