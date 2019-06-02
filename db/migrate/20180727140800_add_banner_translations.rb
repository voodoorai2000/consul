class AddBannerTranslations < ActiveRecord::Migration[4.2]

  def self.up
    create_table :banner_translations, force: :cascade do |t|
      t.string   :title
      t.text     :description

      t.integer  :banner_id,   null: false
      t.string   :locale,      null: false

      t.timestamps null: false

      t.index [:banner_id], name: "index_banner_translations_on_banner_id", using: :btree
      t.index [:locale], name: "index_banner_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :banner_translations
  end
end

