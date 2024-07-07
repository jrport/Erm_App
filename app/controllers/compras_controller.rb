class ComprasController < ApplicationController
  before_action :user_admin?
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
    @compra = Compra.new(compra_params.except(:items_de_compras_attributes))
    unless compra_params[:items_de_compras_attributes].nil?
      @items = create_items
      @compra.items_de_compras = @items
    end
    respond_to do |format|
      if @compra.save
        if @compra.items_de_compras.create
          format.html { redirect_to @compra, notice: 'Compra created successfully.' }
        else
          format.html { render :new, status: :unprocessable_entity, alert: 'Failed to create items de compras.' }
        end
      else
        format.html { render :new, status: :unprocessable_entity, alert: 'Failed to save compra.' }
      end
    end
  end

  def bulk_new_items(item_params)
    quantidade = item_params[:quantidade].to_i
    items_data = quantidade.times.map { item_params.except(:quantidade) }
    new_items = []
    items_data.each do |data|
      new_items.append(ItemsDeCompra.new(data))
    end
    new_items
  end

  def create_items
    items = []
    compra_params[:items_de_compras_attributes].each_key do |key|
      items += bulk_new_items(compra_params[:items_de_compras_attributes][key])
    end
    items
  end

  private

  def compra_params
    params.require(:compra)
          .permit(
            :data_da_compra,
            :observacoes,
            :valor_total,
            :id,
            items_de_compras_attributes: %i[id loja_id loja nome porcao quantidade observacoes _destroy estado],
            notas: []
          )
  end
end
