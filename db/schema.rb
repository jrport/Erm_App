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

ActiveRecord::Schema[7.1].define(version: 2024_07_14_201109) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "estado", ["muito_ruim", "ruim", "ok"]
  create_enum "status", ["pending", "in_progress", "finished"]

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "compras", force: :cascade do |t|
    t.float "valor_total", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "data_da_compra", default: -> { "CURRENT_TIMESTAMP" }
    t.text "observacoes"
  end

  create_table "items_de_compras", force: :cascade do |t|
    t.string "nome", null: false
    t.string "observacoes"
    t.enum "estado", default: "ok", null: false, enum_type: "estado"
    t.float "preco"
    t.bigint "loja_id", null: false
    t.bigint "compra_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "codigo_de_barra", default: -> { "uuid_generate_v4()" }
    t.string "porcao", default: "Unidade", null: false
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

  create_table "transferencias", force: :cascade do |t|
    t.bigint "origem_id", null: false
    t.bigint "destino_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destino_id"], name: "index_transferencias_on_destino_id"
    t.index ["item_id"], name: "index_transferencias_on_item_id"
    t.index ["origem_id"], name: "index_transferencias_on_origem_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.bigint "loja_id", null: false
    t.boolean "deletable", default: true
    t.boolean "dev", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["loja_id"], name: "index_users_on_loja_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "items_de_compras", "compras"
  add_foreign_key "items_de_compras", "lojas"
  add_foreign_key "items_de_pedidos", "pedidos"
  add_foreign_key "pedidos", "lojas"
  add_foreign_key "transferencias", "items_de_compras", column: "item_id"
  add_foreign_key "transferencias", "lojas", column: "destino_id"
  add_foreign_key "transferencias", "lojas", column: "origem_id"
  add_foreign_key "users", "lojas"
end
