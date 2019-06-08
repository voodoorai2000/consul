class AddActivePollsTranslations < ActiveRecord::Migration[4.2]

  def self.up
    create_table :active_poll_translations, force: :cascade do |t|
      t.text     :description

      t.integer  :active_poll_id, null: false
      t.string   :locale,         null: false

      t.timestamps null: false

      t.index [:active_poll_id], name: "index_active_poll_translations_on_active_poll_id", using: :btree
      t.index [:locale], name: "index_active_poll_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :active_poll_translations
  end

end
