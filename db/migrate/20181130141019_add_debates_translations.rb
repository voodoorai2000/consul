class AddDebatesTranslations < ActiveRecord::Migration
  def self.up
    create_table :debate_translations, force: :cascade do |t|
      t.string   :title
      t.text     :description

      t.integer  :debate_id,   null: false
      t.string   :locale,      null: false

      t.timestamps null: false

      t.index [:debate_id], name: "index_debate_translations_on_debate_id", using: :btree
      t.index [:locale], name: "index_debate_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :debate_translations
  end
end
