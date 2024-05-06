# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_05_061906) do
  create_table "compras", force: :cascade do |t|
    t.float "valor_total", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "nome"
    t.integer "quantidade"
    t.text "descricao"
    t.integer "pedido_id"
    t.integer "compra_id"
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "loja_id"
    t.index ["compra_id"], name: "index_items_on_compra_id"
    t.index ["loja_id"], name: "index_items_on_loja_id"
    t.index ["pedido_id"], name: "index_items_on_pedido_id"
  end

  create_table "lojas", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "status", default: "Pendente"
    t.integer "loja_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loja_id"], name: "index_pedidos_on_loja_id"
  end

  add_foreign_key "items", "compras"
  add_foreign_key "items", "lojas"
  add_foreign_key "items", "pedidos"
  add_foreign_key "pedidos", "lojas"
end
