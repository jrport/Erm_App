class LojistaController < ApplicationController
  layout 'lojista', only: %i[index new create show edit update]
  before_action :authenticate_user!
  before_action :pedido_params, only: %i[create]

  def index
    @current_user = helpers.current_user
    @pedidos = Pedido.where(loja_id: @current_user.loja_id)
    @novo_pedido = Pedido.new(data_do_pedido: Time.now, loja_id: @current_user.loja_id)
    @novo_pedido.items_de_pedidos.build
  end

  def show
    @pedido = Pedido.find(params[:id])
    render turbo_stream: turbo_stream.replace('detalhes', partial: 'lojista/show', locals: { pedido: @pedido })
  end

  def edit; end

  def update; end

  def create
    @pedido = Pedido.new(pedido_params)
    respond_to do |format|
      if @pedido.save
        format.html { redirect_to lojista_path(@pedido.id), notice: 'Pedido criado' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def pedido_params
    params.require(:pedido).permit(:data_do_pedido, :loja_id, :observacoes,
                                   items_de_pedidos_attributes: %i[id nome quantidade porcao quantidade observacoes])
  end
end
