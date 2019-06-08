class AddPollQuestionTranslations < ActiveRecord::Migration[4.2]

  def self.up
    create_table :poll_question_translations, force: :cascade do |t|
      t.string   :title

      t.integer  :poll_question_id, null: false
      t.string   :locale,           null: false

      t.timestamps null: false

      t.index [:poll_question_id], name: "index_poll_question_translations_on_poll_question_id", using: :btree
      t.index [:locale], name: "index_poll_question_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :poll_question_translations
  end

end
