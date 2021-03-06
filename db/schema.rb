# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_19_225310) do

  create_table "licencias", force: :cascade do |t|
    t.date "inicio"
    t.date "final"
    t.integer "secuencia"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_licencias_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer "numero"
    t.string "nombre"
    t.string "email"
    t.date "fechaNacimiento"
    t.boolean "presidente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fiat_supernumerario"
    t.date "fiat_notario_titular"
    t.date "asamblea_aceptacion"
    t.date "inicio_ejercicio"
    t.date "revocacion_fiat"
    t.string "motivo_revocacion"
    t.integer "status", default: 1
  end

  create_table "mensajes", force: :cascade do |t|
    t.string "tipo"
    t.text "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reconocimientos", force: :cascade do |t|
    t.date "reconocimiento"
    t.integer "servicio_reconocido"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_reconocimientos_on_member_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
