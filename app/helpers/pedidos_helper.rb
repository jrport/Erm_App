module PedidosHelper
  include Pagy::Frontend

  def status_badge(status)
    case status
    when 'pending'
      '<div class="badge badge-sm badge-error max-xl:rounded-lg px-2 py-3">Pendente</div>'.html_safe
    when 'in_progress'
      '<div class="badge badge-sm badge-warning max-xl:rounded-lg px-2 py-3">Em progresso</div>'.html_safe
    else
      '<div class="badge badge-sm badge-success max-xl:rounded-lg px-2 py-3">Finalizado</div>'.html_safe
    end
  end
end
