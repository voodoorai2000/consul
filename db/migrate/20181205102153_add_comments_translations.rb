class AddCommentsTranslations < ActiveRecord::Migration
  def self.up
    create_table :comment_translations, force: :cascade do |t|
      t.text     :body

      t.integer  :comment_id, null: false
      t.string   :locale,     null: false

      t.timestamps null: false

      t.index [:comment_id], name: "index_comment_translations_on_comment_id", using: :btree
      t.index [:locale], name: "index_comment_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :comment_translations
  end
end
