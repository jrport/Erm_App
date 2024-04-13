class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all
    @lojas = Loja.all
  end

  def show
    pedido_id = params[:id]
    @pedido = Pedido.find(pedido_id)
    @loja = @lojas.find(@pedido.loja_id)
    @items = Item.where(pedido_id: pedido_id)
  end

  def new
    @lojas = Loja.all
  end
end
