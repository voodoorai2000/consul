class AddPollTranslations < ActiveRecord::Migration[4.2]

  def self.up
    create_table :poll_translations, force: :cascade do |t|
      t.string   :name
      t.text     :summary
      t.text     :description

      t.integer  :poll_id,     null: false
      t.string   :locale,      null: false

      t.timestamps null: false

      t.index [:poll_id], name: "index_poll_translations_on_poll_id", using: :btree
      t.index [:locale], name: "index_poll_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :poll_translations
  end

end
