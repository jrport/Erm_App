# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Loja.create(nome: 'Central', endereco: 'Rua Mantinopo, 1, Snto Antônio dos Prazeres', telefone: '(00) 0000-0000',
            # email: 'email@email.com')
# User.create(email: 'admin@admin.com', password: 'admin', admin: true, loja_id: 1)
# User.create(email: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD'], admin: true, loja_id: 1)

# 15.times do
  # Loja.create(
    # nome: Faker::Address.city,
    # endereco: Faker::Address.street_name,
    # telefone: Faker::PhoneNumber.phone_number,
    # email: Faker::Internet.email
  # )
# end

# 50.times do
  # Pedido.create(
    # loja: Loja.find((1..15).to_a.sample),
    # status: %w[pending in_progress finished].sample,
    # data_do_pedido: Faker::Date.between(from: '2024/01/01', to: '2024/12/30')
  # )
# end

# 200.times do
  # ItemsDePedido.create(
    # pedido_id: Faker::Number.between(from: 1, to: 50),
    # nome: Faker::Appliance.equipment,
    # quantidade: Faker::Number.between(from: 1, to: 100),
    # porcao: %w[unidade duzia dezena].sample,
    # created_at: Faker::Date.between(from: '2024/01/01', to: '2024/12/30')
  # )
# end

# 60.times do
  # Compra.create(
    # data_da_compra: Faker::Date.between(from: '2024/01/01', to: '2024/12/30'),
    # valor_total: Faker::Number.decimal(l_digits: 4, r_digits: 2)
  # )
# end

# 200.times do
  # ItemsDeCompra.create(
    # loja_id: Faker::Number.between(from: 1, to: 15),
    # nome: Faker::Appliance.equipment,
    # porcao: %w[unidade duzia dezena].sample,
    # estado: %w[muito_ruim ruim ok].sample,
    # compra_id: Faker::Number.between(from: 1, to: 60)
  # )
# end

# 300.times do
  # item = ItemsDeCompra.find(Faker::Number.between(from: 1, to: 200))
  # item.update(loja_id: Faker::Number.between(from: 1, to: 15))
# end
