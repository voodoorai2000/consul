class AddBudgetInvestmentTranslations < ActiveRecord::Migration
  def self.up
    create_table :budget_investment_translations, force: :cascade do |t|
      t.string   :title
      t.text     :description

      t.integer  :budget_investment_id, null: false
      t.string   :locale,               null: false

      t.timestamps null: false

      t.index [:budget_investment_id], name: "index_budget_investment_translations_on_budget_investment_id", using: :btree
      t.index [:locale], name: "index_budget_investment_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :budget_investment_translations
  end
end
