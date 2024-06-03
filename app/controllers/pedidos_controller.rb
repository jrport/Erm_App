class PedidosController < ApplicationController
  include Pagy::Backend
  def index
    @ransack_query = Pedido.ransack(params[:query])
    @ransack_query.sorts = 'created_at desc' if @ransack_query.sorts.empty?

    @ransack_results = @ransack_query.result.includes(:loja)
    @pagy, @pedidos = pagy(@ransack_results)

    today = Date.today
    @month_pedidos = Pedido.where(created_at: today.beginning_of_month..today.end_of_month)
    @month_pedidos_count = @month_pedidos.count
    @open_count = @month_pedidos.pending.count
    @finished_count = @month_pedidos.finished.count
  end

  def chart
    render json: Pedido.joins(:loja).group('lojas.nome').count
  end

  def bulk_update
    Pedido.find(params[:ids]).update(status: params[:new_status])

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end
end
