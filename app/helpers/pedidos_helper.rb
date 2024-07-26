module PedidosHelper
  include Pagy::Frontend

  def table_headers(include_blank: true)
    headers = if include_blank
                ['Nome', 'Quantidade', 'Porção', 'Detalhes', '']
              else
                %w[Nome Quantidade Porção Detalhes]
              end
    headers.map do |header|
      "<div class='border-b-2 text-semibold text-center border-gray-400 p-2'>#{header}</div>".html_safe
    end.join("\n").html_safe
  end

  def status_badge(estado)
    badge_classes, icon, text = case estado
                                when 'pending' then %w[badge-error dangerous Pendente]
                                when 'in_progress' then ['badge-warning', 'warning', 'Em progresso']
                                else %w[badge-success check Finalizado]
                                end
    "
    <div class='inline-flex gap-1 badge badge-sm text-base #{badge_classes} max-xl:rounded-lg px-2 py-3'>
      <span class='mi'>#{icon}</span> #{text}
    </div>
    ".html_safe
  end
end
