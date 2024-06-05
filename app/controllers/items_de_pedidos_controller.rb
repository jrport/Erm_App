class ItemsDePedidosController < ApplicationController
  def index; end

  def show
    @itemDePedido = itemDePedido.find(params[:id])
  end

  def new; end

  private

  def set_pedido
    @pedido = Pedido.find(params[:pedido_id])
  end
end
