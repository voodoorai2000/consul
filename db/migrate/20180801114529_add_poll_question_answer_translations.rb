class AddPollQuestionAnswerTranslations < ActiveRecord::Migration[4.2]

  def self.up
    create_table :poll_question_answer_translations, force: :cascade do |t|
      t.string   :title
      t.text     :description

      t.integer  :poll_question_answer_id, null: false
      t.string   :locale,                  null: false

      t.timestamps null: false

      t.index [:poll_question_answer_id], name: "index_85270fa85f62081a3a227186b4c95fe4f7fa94b9", using: :btree
      t.index [:locale], name: "index_poll_question_answer_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :poll_question_answer_translations
  end

end
