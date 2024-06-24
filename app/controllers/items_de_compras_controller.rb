class ItemsDeComprasController < ApplicationController
  include Pagy::Backend

  def index
    @ransack_query = ItemsDeCompra.ransack(params[:q])
    @ransack_query.sorts = ['data_da_compra desc'] if @ransack_query.sorts.empty?

    results = @ransack_query.result.includes(:loja)
    @pagy, @items = pagy(results, items: 15)
  end

  def show; end

  def new; end

  def create; end

  def delete; end

  def update; end

  def edit; end
end
