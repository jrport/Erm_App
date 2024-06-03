module PedidosHelper
  include Pagy::Frontend

  def status_badge(status)
    case status
    when 'pending'
      '<div class="badge badge-error max-xl:h-fit max-xl:rounded-lg max-xl:py-1">Pendente</div>'.html_safe
    when 'in_progress'
      '<div class="badge badge-warning max-xl:h-fit max-xl:rounded-lg max-xl:py-1">Em progresso</div>'.html_safe
    else
      '<div class="badge badge-success max-xl:h-fit max-xl:rounded-lg max-xl:py-1">Finalizado</div>'.html_safe
    end
  end
end
