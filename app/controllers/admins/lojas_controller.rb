class Admins::LojasController < ApplicationController
  layout 'application'
  def index; end

  def new
    @loja = Loja.new
    render turbo_stream: turbo_stream.before('add_loja_button', partial: 'admins/lojas/new')
  end
end
