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

ActiveRecord::Schema.define(version: 20190628005104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.integer "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campus", force: :cascade do |t|
    t.string "nombre"
    t.text "ubicacion"
    t.text "mapa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clases_buscos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.integer "cid"
    t.boolean "validacion", default: true
    t.datetime "inicio"
    t.datetime "termino"
  end

  create_table "clases_ofrezcos", force: :cascade do |t|
    t.integer "uid"
    t.integer "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.integer "cid"
    t.boolean "validacion", default: true
    t.datetime "inicio"
    t.datetime "termino"
  end

  create_table "comment_likes", force: :cascade do |t|
    t.integer "uid"
    t.integer "cid"
    t.integer "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "pid"
    t.integer "uid"
    t.string "autor"
    t.text "contenido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cursos", force: :cascade do |t|
    t.string "nombre"
    t.string "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.datetime "fecha_creacion"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.integer "user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.integer "pid"
    t.integer "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grupo_estudios", force: :cascade do |t|
    t.string "curso"
    t.integer "capacidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.integer "cid"
    t.integer "creador_id"
    t.datetime "inicio"
    t.datetime "termino"
    t.boolean "validacion", default: true
  end

  create_table "join_clases_buscos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "eid"
    t.integer "uid"
  end

  create_table "join_clases_ofrezcos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "eid"
    t.integer "uid"
  end

  create_table "join_cursos", force: :cascade do |t|
    t.integer "uid"
    t.integer "cid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipo"
  end

  create_table "join_events", force: :cascade do |t|
    t.integer "uid"
    t.integer "eid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_grupo_estudios", force: :cascade do |t|
    t.integer "uid"
    t.integer "eid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "uid"
    t.integer "tipo"
    t.integer "pid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "from"
    t.integer "to"
    t.text "subject"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moderators", force: :cascade do |t|
    t.integer "uid"
    t.integer "cid"
    t.integer "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", force: :cascade do |t|
    t.string "titulo"
    t.integer "aid"
    t.string "autor"
    t.integer "cid"
    t.string "curso"
    t.text "contenido"
    t.string "descripcion"
    t.integer "likes"
    t.integer "dislikes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer "uid"
    t.integer "rid"
    t.float "disp"
    t.float "enchufe"
    t.float "ruido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "nombre"
    t.text "ubicacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "campu_id"
  end

  create_table "sala_ocupadas", force: :cascade do |t|
    t.string "evento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.datetime "inicio"
    t.datetime "termino"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "about"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
