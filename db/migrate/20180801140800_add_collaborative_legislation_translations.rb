class AddCollaborativeLegislationTranslations < ActiveRecord::Migration[4.2]

  def self.up
    create_table :legislation_process_translations, force: :cascade do |t|
      t.string   :title
      t.text     :summary
      t.text     :description
      t.text     :additional_info

      t.integer  :legislation_process_id, null: false
      t.string   :locale,                 null: false

      t.timestamps null: false

      t.index [:legislation_process_id], name: "index_199e5fed0aca73302243f6a1fca885ce10cdbb55", using: :btree
      t.index [:locale], name: "index_legislation_process_translations_on_locale", using: :btree
    end

    create_table :legislation_question_translations, force: :cascade do |t|
      t.text     :title

      t.integer  :legislation_question_id, null: false
      t.string   :locale,                  null: false

      t.timestamps null: false

      t.index [:legislation_question_id], name: "index_d34cc1e1fe6d5162210c41ce56533c5afabcdbd3", using: :btree
      t.index [:locale], name: "index_legislation_question_translations_on_locale", using: :btree
    end

    create_table :legislation_draft_version_translations, force: :cascade do |t|
      t.string   :title
      t.text     :changelog
      t.text     :body
      t.text     :body_html
      t.text     :toc_html

      t.integer  :legislation_draft_version_id, null: false
      t.string   :locale,                       null: false

      t.timestamps null: false

      t.index [:legislation_draft_version_id], name: "index_900e5ba94457606e69e89193db426e8ddff809bc", using: :btree
      t.index [:locale], name: "index_legislation_draft_version_translations_on_locale", using: :btree
    end

    create_table :legislation_question_option_translations, force: :cascade do |t|
      t.string   :value

      t.integer  :legislation_question_option_id, null: false
      t.string   :locale,                         null: false

      t.timestamps null: false

      t.index [:legislation_question_option_id], name: "index_61bcec8729110b7f8e1e9e5ce08780878597a209", using: :btree
      t.index [:locale], name: "index_legislation_question_option_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :legislation_process_translations
    drop_table :legislation_question_translations
    drop_table :legislation_draft_version_translations
    drop_table :legislation_question_option_translations
  end
end
