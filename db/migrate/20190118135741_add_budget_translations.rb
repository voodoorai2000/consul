class AddBudgetTranslations < ActiveRecord::Migration[4.2]

  def self.up
    create_table :budget_translations, force: :cascade do |t|
      t.string   :name

      t.integer  :budget_id,  null: false
      t.string   :locale,     null: false

      t.timestamps null: false

      t.index [:budget_id], name: "index_budget_translations_on_budget_id", using: :btree
      t.index [:locale], name: "index_budget_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :budget_translations
  end

end
