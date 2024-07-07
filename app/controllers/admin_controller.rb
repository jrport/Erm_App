class AdminController < ApplicationController
  def index
    @lojas = Loja.all
    @users = User.all
  end
end
