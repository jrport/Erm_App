class InventariosController < ApplicationController
  before_action :user_admin?
  include Pagy::Backend
  before_action :bulk_update_params, only: :bulk_update
  before_action :bulk_ids, only: :bulk_update

  def index
    @ransack_query = ItemsDeCompra.ransack(params[:q])
    @ransack_query.sorts = ['compra_data_da_compra desc'] if @ransack_query.sorts.empty?

    results = @ransack_query.result.includes(:loja)
    @pagy, @items = pagy(results, items: 15)
  end

  def bulk_update
    ItemsDeCompra
      .where(id: bulk_ids)
      .update_all(bulk_update_params)

    @ransack_query = ItemsDeCompra.ransack(params[:q])
    @ransack_query.sorts = ['data_da_compra desc'] if @ransack_query.sorts.empty?

    results = @ransack_query.result.includes(:loja)
    @pagy, @items = pagy(results, items: 15)

    render partial: 'inventarios/table', locals: { ransack: @ransack_query, items: @items, pagy: @pagy }
  end

  def show
    @item = ItemsDeCompra.find(params[:id])
  end

  def update
    ItemsDeCompra.update(edit_params['id'], { ** edit_params.except('id') })
    @item = ItemsDeCompra.find(edit_params['id'])
    render 'inventarios/show'
  end

  def new; end

  def create; end

  def delete; end

  private

  def edit_params
    { **params.permit(:id), **params.require(:items_de_compra).permit(:loja_id, :observacoes, :estado) }
  end

  def bulk_update_params
    { estado: params.require(:estado), loja_id: params.require(:loja_id) }
  end

  def bulk_ids
    params.require(:items_id).split(',')
  end
end
