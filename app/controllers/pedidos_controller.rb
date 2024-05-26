class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[show edit update destroy]

  # GET /pedidos or /pedidos.json
  def index
    @ransack_query = Pedido.ransack(params[:q])
    @ransack_query.sorts = 'created_at desc' if @ransack_query.sorts.empty?
    @pagy, @pedidos = pagy(@ransack_query.result, items: 10, size: 4)
  end

  # GET /pedidos_chart
  def pedidos_chart
    render json: Pedido.joins(:loja).group('lojas.nome').count
  end

  # GET /pedidos/1 or /pedidos/1.json
  def show; end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit; end

  # POST /pedidos or /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to pedido_url(@pedido), notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1 or /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to pedido_url(@pedido), notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1 or /pedidos/1.json
  def destroy
    @pedido.destroy!

    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pedido_params
    params.fetch(:pedido, {})
  end
end
