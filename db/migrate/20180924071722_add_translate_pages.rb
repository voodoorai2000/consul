class AddTranslatePages < ActiveRecord::Migration[4.2]
  def self.up
    create_table :site_customization_page_translations, force: :cascade do |t|
      t.string   :title
      t.string   :subtitle
      t.text     :content

      t.integer  :site_customization_page_id, null: false
      t.string   :locale,                     null: false

      t.timestamps null: false

      t.index [:site_customization_page_id], name: "index_7fa0f9505738cb31a31f11fb2f4c4531fed7178b", using: :btree
      t.index [:locale], name: "index_site_customization_page_translations_on_locale", using: :btree
    end

    change_column :site_customization_pages, :title, :string, null: true
  end

  def self.down
    drop_table :site_customization_page_translations
    change_column :site_customization_pages, :title, :string, null: false
  end
end
