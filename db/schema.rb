# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 11) do

  create_table "locaciones", :force => true do |t|
    t.string   "nombre",           :default => "",                :null => false
    t.string   "persona_contacto"
    t.string   "horario_contacto"
    t.string   "telefono"
    t.string   "mail"
    t.string   "calle"
    t.integer  "numero"
    t.string   "depto"
    t.string   "localidad"
    t.string   "ciudad",           :default => "Capital Federal"
    t.string   "pais",             :default => "Argentina"
    t.integer  "capacidad"
    t.float    "precio"
    t.text     "detalles"
    t.integer  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticias", :force => true do |t|
    t.string   "titulo"
    t.string   "cuerpo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "toques", :force => true do |t|
    t.string   "nombre"
    t.datetime "cuando"
    t.string   "notas"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "precio_anticipada"
    t.float    "precio_puerta"
    t.string   "flyer"
    t.boolean  "notificado",        :default => false
    t.integer  "locacion_id"
    t.boolean  "portada",           :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
