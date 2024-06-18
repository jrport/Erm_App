class ItemsDeComprasController < ApplicationController
  include Pagy::Backend
  before_action :paginate, only: [:index]

  def index; end

  private
  
  def paginate
    @ransack_query = ItemsDeCompra.ransack(params[:query])
    @ransack_query.sorts = 'data_da_compra desc' if @ransack_query.sorts.empty?

    @ransack_results = @ransack_query.result.includes(:compra, :loja)
    @pagy, @items = pagy(@ransack_results, items_extra: true)
  end
end
