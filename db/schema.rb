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

ActiveRecord::Schema[7.1].define(version: 2024_06_02_045931) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "pedido_status", ["pending", "in_progress", "finished"]

  create_table "compras", force: :cascade do |t|
    t.float "valor_total", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "nome", null: false
    t.string "porcao", default: "unitario", null: false
    t.integer "quantidade", default: 1, null: false
    t.text "observacoes"
    t.bigint "compra_id"
    t.bigint "pedido_id"
    t.bigint "loja_id"
    t.index ["compra_id"], name: "index_items_on_compra_id"
    t.index ["loja_id"], name: "index_items_on_loja_id"
    t.index ["pedido_id"], name: "index_items_on_pedido_id"
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
    t.enum "status", default: "pending", null: false, enum_type: "pedido_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "observacoes"
    t.index ["loja_id"], name: "index_pedidos_on_loja_id"
  end

  add_foreign_key "items", "compras"
  add_foreign_key "items", "pedidos"
  add_foreign_key "pedidos", "lojas"
end
