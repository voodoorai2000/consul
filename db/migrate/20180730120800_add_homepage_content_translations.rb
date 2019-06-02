class AddHomepageContentTranslations < ActiveRecord::Migration[4.2]

  def self.up
    create_table :widget_card_translations, force: :cascade do |t|
      t.string   :title
      t.text     :description
      t.string   :label
      t.string   :link_text

      t.integer  :widget_card_id, null: false
      t.string   :locale,         null: false

      t.timestamps null: false

      t.index [:widget_card_id], name: "index_widget_card_translations_on_widget_card_id", using: :btree
      t.index [:locale], name: "index_widget_card_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :widget_card_translations
  end
end

