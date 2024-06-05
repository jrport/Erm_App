module PedidosHelper
  include Pagy::Frontend

  def status_badge(status)
    case status
    when 'pending'
      '<div class="badge badge-error max-xl:h-fit max-xl:rounded-lg 2xl:py-4 2xl:text-lg">Pendente</div>'.html_safe
    when 'in_progress'
      '<div class="badge badge-warning max-xl:h-fit max-xl:rounded-lg 2xl:py-4 2xl:text-lg">Em progresso</div>'.html_safe
    else
      '<div class="badge badge-success max-xl:h-fit max-xl:rounded-lg 2xl:py-4 2xl:text-lg">Finalizado</div>'.html_safe
    end
  end
end
