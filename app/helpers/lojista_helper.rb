module LojistaHelper
  def lojista_status_badge(estado)
    badge_classes, icon, text = case estado
                                when 'pending' then %w[badge-error dangerous Pendente]
                                when 'in_progress' then ['badge-warning', 'warning', 'Em progresso']
                                else %w[badge-success check Finalizado]
                                end
    "
    <div class='inline-flex gap-1 badge badge-xs font-semibold #{badge_classes} max-xl:rounded-lg px-2 py-3'>
      <span class='mi'>#{icon}</span> #{text}
    </div>
    ".html_safe
  end
end
