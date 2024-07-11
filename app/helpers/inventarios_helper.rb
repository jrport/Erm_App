module InventariosHelper
  include Pagy::Frontend

  def estado_badge(estado)
    badge_classes, icon, text = case estado
                                when 'muito_ruim' then %w[badge-error dangerous Crítico]
                                when 'ruim' then %w[badge-warning warning Desgastado]
                                else %w[badge-success check Bom]
                                end
    "
    <div class='inline-flex gap-1 badge badge-sm text-lg #{badge_classes} max-xl:rounded-lg px-2 py-3'>
      <span class='mi'>#{icon}</span> #{text}
    </div>
    ".html_safe
  end
end
