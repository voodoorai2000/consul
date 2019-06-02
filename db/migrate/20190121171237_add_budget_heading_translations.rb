class AddBudgetHeadingTranslations < ActiveRecord::Migration[4.2]

  def self.up
    create_table :budget_heading_translations, force: :cascade do |t|
      t.string   :name

      t.integer  :budget_heading_id, null: false
      t.string   :locale,            null: false

      t.timestamps null: false

      t.index [:budget_heading_id], name: "index_budget_heading_translations_on_budget_heading_id", using: :btree
      t.index [:locale], name: "index_budget_heading_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :budget_heading_translations
  end

end
