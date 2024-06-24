class ItemsDePedidosController < ApplicationController
  def new; end

  def update; end

  def create; end

  def destroy
    @item_de_pedido = ItemsDePedido.find(params[:id])
    raise
    @item_de_pedido.destroy!
    render turbo_stream: turbo_stream.remove("item_#{params[:id]}")
  end
end
