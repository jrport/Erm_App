class Admin::LojasController < ApplicationController
  before_action :user_admin?
  def new
    @loja = Loja.new
    render turbo_stream: turbo_stream.prepend('content', partial: 'admin/lojas/modal',
                                                         locals: { edit: false, loja: @loja })
  end

  def create
    @loja = Loja.new(loja_params)
    if @loja.save
      redirect_to configuracoes_path, notice: 'Loja criada com sucesso!'
    else
      render turbo_stream: turbo_stream.replace('modal', partial: 'admin/lojas/modal',
                                                         locals: { edit: false, loja: @loja })
    end
  end

  def edit
    @loja = Loja.find(params[:id])
    render turbo_stream: turbo_stream.prepend('content', partial: 'admin/lojas/modal',
                                                         locals: { edit: true, loja: @loja })
  end

  def update
    @loja = Loja.find(params[:id])
    if @loja.update(loja_params)
      redirect_to configuracoes_path, notice: 'Loja alterado com sucesso'
    else
      render turbo_stream: turbo_stream.replace('modal', partial: 'admin/lojas/modal',
                                                         locals: { edit: true, loja: @loja })
    end
  end

  def destroy
    @loja = Loja.find(params[:id])
    @loja.destroy!
    redirect_to configuracoes_path, notice: 'Loja removida'
  end

  private

  def loja_params
    params.require(:loja).permit(:nome, :endereco, :telefone, :email)
  end
end
