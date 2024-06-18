module ItemsDeComprasHelper
  def estado_badge(status)
    case status
    when 'muito ruim'
      '<div class="badge badge-error max-xl:h-fit max-xl:rounded-lg 2xl:py-4 2xl:text-lg">Muito Ruim</div>'.html_safe
    when 'ruim'
      '<div class="badge badge-warning max-xl:h-fit max-xl:rounded-lg 2xl:py-4 2xl:text-lg">Desgastado</div>'.html_safe
    else
      '<div class="badge badge-success max-xl:h-fit max-xl:rounded-lg 2xl:py-4 2xl:text-lg">Conservado</div>'.html_safe
    end
  end
end
