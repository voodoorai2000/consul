class AddBudgetGroupTranslations < ActiveRecord::Migration[4.2]

  def self.up
    create_table :budget_group_translations, force: :cascade do |t|
      t.string   :name

      t.integer  :budget_group_id, null: false
      t.string   :locale,          null: false

      t.timestamps null: false

      t.index [:budget_group_id], name: "index_budget_group_translations_on_budget_group_id", using: :btree
      t.index [:locale], name: "index_budget_group_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :budget_group_translations
  end

end
