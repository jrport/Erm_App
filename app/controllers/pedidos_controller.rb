class PedidosController < ApplicationController
  before_action :bulk_params, only: [:bulk_update]
  before_action :metrics, only: %i[index bulk_update]
  before_action :create_params, only: %i[create]
  before_action :update_params, only: %i[update]
  include Pagy::Backend

  def index
    @ransack_query = Pedido.ransack(params[:q])
    @ransack_query.sorts = ['data_do_pedido desc'] if @ransack_query.sorts.empty?

    results = @ransack_query.result.includes(:loja)
    @pagy, @pedidos = pagy(results, items: 15)
    @metrics = metrics
  end

  def new
    @pedido = Pedido.new(data_do_pedido: Time.now)
    @pedido.items_de_pedidos.build
  end

  def show
    @pedido = Pedido.find(params[:id])
  end

  def create
    @pedido = Pedido.new(create_params)
    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @pedido = Pedido.find(params[:id])
  end

  def update
    @pedido = Pedido.find(params[:id])
    respond_to do |format|
      if @pedido.update(update_params)
        format.html { redirect_to @pedido, notice: 'Pedido atualizado' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy!
    redirect_to pedidos_path, notice: 'Pedido excluído com sucesso'
  end

  def chart
    this_month = Date.today.beginning_of_month..Date.today.end_of_month
    render json: Pedido.where(data_do_pedido: this_month).joins(:loja).group('lojas.nome').count
  end

  def bulk_update
    Pedido.where(bulk_params[:id]).update_all(bulk_params[:status])

    render partial: 'pedidos/bulk_update',
           locals: {
             ids: bulk_params[:id][:id],
             status: bulk_params[:status][:status],
             metrics:
           }
  end

  private

  def create_params
    params.require(:pedido)
          .permit(
            :loja_id, :data_do_pedido, :observacoes,
            items_de_pedidos_attributes: %i[nome quantidade porcao observacoes _destroy]
          )
  end

  def update_params
    params.require(:pedido)
          .permit(
            :loja_id, :data_do_pedido, :observacoes, :controller, :id,
            items_de_pedidos_attributes: %i[id nome quantidade porcao observacoes _destroy]
          )
  end

  def bulk_params
    permitted_params = params
                       .require(:pedido)
                       .permit(:status, :ids_list)

    id = permitted_params[:ids_list]
         .split(',')
         .map(&:strip)
    status = permitted_params[:status]

    { id: { id: }, status: { status: } }
  end

  def metrics
    {
      total: Pedido.group_by_month(:data_do_pedido, last: 1).count.values.first,
      finished: Pedido.group_by_month(:data_do_pedido, last: 1).finished.count.values.first,
      pending: Pedido.group_by_month(:data_do_pedido, last: 1).pending.count.values.first
    }
  end
end
