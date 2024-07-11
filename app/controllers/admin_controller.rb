class AdminController < ApplicationController
  before_action :user_admin?
  def index
    @lojas = Loja.all
    @users = User.all
  end
end
