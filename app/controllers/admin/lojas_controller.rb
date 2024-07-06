class Admin::LojasController < ApplicationController
  layout 'application'
  def index
    @lojas = Loja.all
  end
end
