class CreateI18nContentTranslations < ActiveRecord::Migration[4.2]
  def change
    create_table :i18n_contents do |t|
      t.string :key
    end

    reversible do |dir|
      dir.up do
        create_table :i18n_content_translations, force: :cascade do |t|
          t.text     :value

          t.integer  :i18n_content_id, null: false
          t.string   :locale,          null: false

          t.timestamps null: false

          t.index [:i18n_content_id], name: "index_i18n_content_translations_on_i18n_content_id", using: :btree
          t.index [:locale], name: "index_i18n_content_translations_on_locale", using: :btree
        end
      end

      dir.down do
        drop_table :i18n_content_translations
      end
    end
  end
end
