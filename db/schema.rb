# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130106194437) do

  create_table "blog_posts", :force => true do |t|
    t.string   "title",          :limit => 100, :default => "", :null => false
    t.text     "content",                                       :null => false
    t.integer  "author_id",                     :default => 0,  :null => false
    t.string   "category",       :limit => 20,  :default => "", :null => false
    t.string   "status",         :limit => 20,  :default => "", :null => false
    t.integer  "comments_count",                :default => 0,  :null => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "blog_posts", ["author_id"], :name => "index_blog_posts_on_author_id"

  create_table "categories", :force => true do |t|
    t.string   "name",        :limit => 50, :default => "", :null => false
    t.string   "short_name",  :limit => 30, :default => "", :null => false
    t.string   "description",               :default => "", :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "categories_posts", :force => true do |t|
    t.integer  "category_id", :null => false
    t.integer  "post_id",     :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categories_posts", ["category_id"], :name => "index_categories_posts_on_category_id"
  add_index "categories_posts", ["post_id"], :name => "index_categories_posts_on_post_id"

  create_table "comments", :force => true do |t|
    t.text     "content",                                    :null => false
    t.string   "author",       :limit => 50, :default => "", :null => false
    t.string   "author_email", :limit => 50, :default => "", :null => false
    t.integer  "status",                                     :null => false
    t.integer  "post_id",                                    :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title",      :limit => 100, :default => "",  :null => false
    t.text     "body",                                       :null => false
    t.string   "author",     :limit => 100, :default => "0", :null => false
    t.string   "category",   :limit => 20,  :default => "",  :null => false
    t.string   "status",     :limit => 20,  :default => "",  :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username",        :limit => 25, :default => "",  :null => false
    t.string   "hashed_password", :limit => 40, :default => "0", :null => false
    t.string   "first_name",      :limit => 25, :default => "",  :null => false
    t.string   "last_name",       :limit => 25, :default => "",  :null => false
    t.string   "email",           :limit => 50, :default => "",  :null => false
    t.string   "displayname",     :limit => 50, :default => "",  :null => false
    t.integer  "user_level",                                     :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

end
