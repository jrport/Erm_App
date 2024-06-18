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

ActiveRecord::Schema[7.1].define(version: 2024_06_14_005750) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "estado", ["muito_ruim", "ruim", "ok"]
  create_enum "status", ["pending", "in_progress", "finished"]

  create_table "compras", force: :cascade do |t|
    t.float "valor_total", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "data_da_compra", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "items_de_compras", force: :cascade do |t|
    t.string "nome", null: false
    t.string "observacoes"
    t.integer "quantidade", default: 1, null: false
    t.enum "estado", default: "ok", null: false, enum_type: "estado"
    t.float "preco"
    t.bigint "loja_id", null: false
    t.bigint "compra_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "data_da_compra", null: false
    t.index ["compra_id"], name: "index_items_de_compras_on_compra_id"
    t.index ["loja_id"], name: "index_items_de_compras_on_loja_id"
  end

  create_table "items_de_pedidos", force: :cascade do |t|
    t.string "nome", null: false
    t.string "porcao", default: "Unitário", null: false
    t.integer "quantidade", default: 1, null: false
    t.string "observacoes"
    t.bigint "pedido_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_items_de_pedidos_on_pedido_id"
  end

  create_table "lojas", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.bigint "loja_id", null: false
    t.enum "status", default: "pending", null: false, enum_type: "status"
    t.text "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "data_do_pedido", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["loja_id"], name: "index_pedidos_on_loja_id"
  end

  add_foreign_key "items_de_compras", "compras"
  add_foreign_key "items_de_compras", "lojas"
  add_foreign_key "items_de_pedidos", "pedidos"
  add_foreign_key "pedidos", "lojas"
end
