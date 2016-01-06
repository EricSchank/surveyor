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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160106001930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "survey_id",               null: false
    t.string   "answer",     limit: 5000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "answers", ["survey_id"], name: "index_answers_on_survey_id", using: :btree

  create_table "no_surveys", force: :cascade do |t|
    t.integer  "site_id",    null: false
    t.integer  "author_id"
    t.integer  "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "no_surveys", ["site_id", "author_id"], name: "index_no_surveys_on_site_id_and_author_id", using: :btree
  add_index "no_surveys", ["site_id", "ticket_id"], name: "index_no_surveys_on_site_id_and_ticket_id", using: :btree
  add_index "no_surveys", ["site_id"], name: "index_no_surveys_on_site_id", using: :btree

  create_table "results", force: :cascade do |t|
    t.integer  "survey_id",                           null: false
    t.integer  "answer_id",               default: 0
    t.string   "comment",    limit: 5000
    t.integer  "ticket_id"
    t.integer  "tech_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "site_configs", force: :cascade do |t|
    t.integer  "site_id",                                  null: false
    t.string   "survey",      limit: 5000
    t.integer  "max_surveys",              default: 99999
    t.integer  "frequency",                default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "site_configs", ["site_id"], name: "index_site_configs_on_site_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "auid",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sites", ["auid"], name: "index_sites_on_auid", using: :btree

  create_table "survey_histories", force: :cascade do |t|
    t.integer  "site_id",                           null: false
    t.string   "action_id",                         null: false
    t.integer  "ticket_id",                         null: false
    t.boolean  "ticket_specific",   default: false
    t.boolean  "successful",        default: true
    t.integer  "surveying_user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "survey_histories", ["site_id", "action_id"], name: "index_survey_histories_on_site_id_and_action_id", using: :btree
  add_index "survey_histories", ["site_id", "surveying_user_id"], name: "index_survey_histories_on_site_id_and_surveying_user_id", using: :btree
  add_index "survey_histories", ["site_id", "ticket_id"], name: "index_survey_histories_on_site_id_and_ticket_id", using: :btree
  add_index "survey_histories", ["site_id"], name: "index_survey_histories_on_site_id", using: :btree

  create_table "survey_questions", force: :cascade do |t|
    t.integer  "site_id",                 null: false
    t.string   "question",   limit: 5000
    t.string   "answer1",    limit: 500
    t.string   "answer2",    limit: 500
    t.string   "answer3",    limit: 500
    t.string   "answer4",    limit: 500
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "survey_questions", ["site_id"], name: "index_survey_questions_on_site_id", using: :btree

  create_table "survey_responses", force: :cascade do |t|
    t.integer  "survey_question_id",                           null: false
    t.integer  "ticket_id"
    t.integer  "choice",                          default: -1
    t.string   "comment",            limit: 5000
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "assignee_id"
  end

  add_index "survey_responses", ["survey_question_id"], name: "index_survey_responses_on_survey_question_id", using: :btree

  create_table "surveys", force: :cascade do |t|
    t.integer  "site_id",                 null: false
    t.string   "question",   limit: 5000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "surveys", ["site_id"], name: "index_surveys_on_site_id", using: :btree

end
