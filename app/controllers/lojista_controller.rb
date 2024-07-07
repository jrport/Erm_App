class LojistaController < ApplicationController
  layout 'lojista', only: %i[index new create show edit update]

  def index
    # @current_user = current_user
    # @pedidos = Pedido.where(user_id: @current_user.id)
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
  end

  # private

  # def current_user
    # raise
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
end
