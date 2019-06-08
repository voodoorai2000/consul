class AddAdminNotificationTranslations < ActiveRecord::Migration[4.2]

  def self.up
    create_table :admin_notification_translations, force: :cascade do |t|
      t.string   :title
      t.text     :body

      t.integer  :admin_notification_id, null: false
      t.string   :locale,                null: false

      t.timestamps null: false

      t.index [:admin_notification_id], name: "index_admin_notification_translations_on_admin_notification_id", using: :btree
      t.index [:locale], name: "index_admin_notification_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :admin_notification_translations
  end
end

