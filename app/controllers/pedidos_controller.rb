class PedidosController < ApplicationController
  include Pagy::Backend

  def index
    @ransack_query = Pedido.ransack(params[:query])
    @ransack_query.sorts = 'created_at desc' if @ransack_query.sorts.empty?

    @ransack_results = @ransack_query.result.includes(:loja)
    @pagy, @pedidos = pagy(@ransack_results)

    @month_pedidos_count, @open_count, @finished_count = monthly_metrics
  end

  def chart
    render json: Pedido.joins(:loja).group('lojas.nome').count
  end

  def bulk_update
    Pedido.update(update_params[:id], status: update_params[:status])
    _, open_count, finished_count = monthly_metrics

    respond_to do |format|
      format.turbo_stream do
        render partial: 'pedidos/bulk_update',
               locals: { new_status: params[:pedido][:status], badge_ids:,
                         open_count:, finished_count: }
      end
      format.html
    end
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # POST /pedidos/new
  def create
    @pedido = Pedido.new(pedido_params)

    raise params

    # respond_to do |format|
    #   if @items.valid? || @pedido.valid?
    #     @items.save
    #     @pedido.save
    #     format.html { redirect_to @pedido, notice: 'Pedido criado' }
    #     format.html { redirect_to pedidos_path }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #   end
    # end
  end

  private

  def monthly_metrics
    today = Date.today

    month_pedidos = Pedido.where(created_at: today.beginning_of_month..today.end_of_month)
    month_pedidos_count = month_pedidos.count
    open_count = month_pedidos.pending.count
    finished_count = month_pedidos.finished.count

    [month_pedidos_count, open_count, finished_count]
  end

  def badge_ids
    params.require(:pedido)[:id].split(',').map(&:to_i)
  end

  def update_params
    params.require(:pedido).permit(:id, :status)
  end

  def pedido_params
    params.require(:pedido).permit(
      :id, :created_at, :loja_id, :observacoes,
      items_attributes: %i[nome quantidade porcao observacoes]
    )
  end
end
