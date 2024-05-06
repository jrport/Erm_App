# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do
  Loja.new(
    email: Faker::Internet.email,
    telefone: Faker::PhoneNumber.phone_number,
    nome: Faker::Company.name
  ).save()
end

20.times do
  Pedido.new(
    loja_id: Faker::Number.within(range: 1...10),
  ).save()
end

27.times do
  Compra.new().save()
end

60.times do
  Item.new(
    nome: Faker::Appliance.equipment,
    quantidade: Faker::Number.number(digits: 2),
    compra_id: Faker::Number.within(range: 1...20),
    loja_id: Faker::Number.within(range: 1...10),
    valor: Faker::Number.decimal(l_digits: 2, r_digits: 2)
  ).save()
end

20.times do
  Item.new(
    nome: Faker::Appliance.equipment,
    descricao: Faker::Lorem.paragraph,
    quantidade: Faker::Number.number(digits: 2),
    compra_id: Faker::Number.within(range: 1...20),
    loja_id: Faker::Number.within(range: 1...10)
  ).save()
end
