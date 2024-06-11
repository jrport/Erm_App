class PedidosController < ApplicationController
  include Pagy::Backend
  before_action :pagination, only: [:index, :table]
  before_action :monthly_metrics, only: [:index, :bulk_update]
  # before_action :pedido_params, only: [:create]
  before_action :update_params, only: [:bulk_update]
  before_action :set_pedido, only: [:show]

  def index
    @month_pedidos_count, @open_count, @finished_count = monthly_metrics
  end

  def table
    render partial: 'pedidos/table', locals: { 
      ransack: @ransack_query, pagy: @pagy, pedidos: @pedidos
    }
  end

  def chart
    render json: Pedido.joins(:loja).group('lojas.nome').count
  end

  def def show; end

  def bulk_update
    Pedido.update(update_params[:id], status: update_params[:status])
    _, @open_count, @finished_count = monthly_metrics

    respond_to do |format|
      format.turbo_stream do
        render partial: 'pedidos/bulk_update',
               locals: { new_status: params[:pedido][:status], badge_ids:,
                         open_count: @open_count, finished_count: @finished_count }
      end
      format.html
    end
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    @pedido.items_de_pedidos.build
  end

  def update
    if pedido.update(pedido_params)
      redirect_to pedidos_path
    else
      render :edit
    end
  end
  # POST /pedidos/new
  # Isso vai validar os parametros do pedido 
  # e começar a instanciar e chamar o instanciador
  # de items de pedido
  def create
    @pedido = Pedido.new(pedido_params)
    raise
    raise
    # if @pedido.valid?
      # item = @pedidos.items_de_pedido.build
    # else
      # render :new, status: :unprocessable_entity 
    # end
  end

  private

  def monthly_metrics
    today = Date.today

    month_pedidos = Pedido.where(data_do_pedido: today.beginning_of_month..today.end_of_month)
    month_pedidos_count = month_pedidos.count.nil? ? 0 : month_pedidos.count
    open_count = month_pedidos.pending.count.nil? ? 0 : month_pedidos.pending.count
    finished_count = month_pedidos.finished.count.nil? ? 0 : month_pedidos.finished.count

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
      :data_do_pedido, :loja_id, :observacoes,
      items_de_pedidos_attributes: [
        :id,
        :_delete,
        :nome,
        :quantidade,
        :porcao,
        :observacoes,
        :data_do_pedido
      ]
    )
  end

  def pagination
    @ransack_query = Pedido.ransack(params[:query])
    @ransack_query.sorts = 'data_do_pedido desc' if @ransack_query.sorts.empty?

    @ransack_results = @ransack_query.result.includes(:loja)
    @pagy, @pedidos = pagy(@ransack_results)
  end

  def set_pedido
    @pedido = Pedido.find(params[:id])
  end
end
