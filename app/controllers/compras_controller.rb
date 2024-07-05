class ComprasController < ApplicationController
  include Pagy::Backend
  before_action :compra_params, only: %i[create update]

  def index
    @ransack_query = Compra.ransack(params[:q])
    @ransack_query.sorts = ['data_da_compra desc'] if @ransack_query.sorts.empty?

    results = @ransack_query.result
    @pagy, @results = pagy(results, items: 15)

    @compras = Compra.all
  end

  def chart_cost
    render json: Compra.cost_per_month
  end

  def chart_qtd
    render json: Compra.qtd_per_month
  end

  def show
    @compra = Compra.find(params[:id])
  end

  def edit
    @compra = Compra.find(params[:id])
  end

  def update
    @compra = Compra.find(params[:id])
    respond_to do |format|
      if @compra.update(compra_params)
        format.html { redirect_to @compra, notice: 'ModelClassName updated' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def new
    @compra = Compra.new(data_da_compra: Time.now)
  end

  def create
    @compra = Compra.new(compra_params)
    respond_to do |format|
      if @compra.save
        format.html { redirect_to @compra, notice: 'Compra created' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def compra_params
    params.require(:compra)
          .permit(
            :data_da_compra,
            :observacoes,
            :valor_total,
            :id,
            items_de_compras_attributes: %i[id loja_id loja nome observacoes _destroy estado],
            notas: []
          )
  end
end
