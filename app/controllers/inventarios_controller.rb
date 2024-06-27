class InventariosController < ApplicationController
  include Pagy::Backend
  before_action :bulk_update_params, only: :bulk_update
  before_action :bulk_ids, only: :bulk_update

  def index
    @ransack_query = ItemsDeCompra.ransack(params[:q])
    @ransack_query.sorts = ['data_da_compra desc'] if @ransack_query.sorts.empty?

    results = @ransack_query.result.includes(:loja)
    @pagy, @items = pagy(results, items: 15)
  end

  def bulk_update
    ItemsDeCompra
      .where(id: bulk_ids)
      .update_all(bulk_update_params)

    render partial: 'inventarios/_table'
  end

  def show; end

  def new; end

  def create; end

  def delete; end

  def update; end

  def edit; end

  private

  def bulk_update_params
    { estado: params.require(:estado), loja_id: params.require(:loja_id) }
  end

  def bulk_ids
    params.require(:items_id).split(',')
  end
end
