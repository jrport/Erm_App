module ComprasHelper
  def options_for_estado
    options = %w[Crítico Desgastado Bom]
    options.zip(ItemsDeCompra.estados.keys)
  end
end
