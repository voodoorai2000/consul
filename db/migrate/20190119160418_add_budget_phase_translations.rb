class AddBudgetPhaseTranslations < ActiveRecord::Migration[4.2]

  def self.up
    create_table :budget_phase_translations, force: :cascade do |t|
      t.text     :description
      t.text     :summary

      t.integer  :budget_phase_id, null: false
      t.string   :locale,          null: false

      t.timestamps null: false

      t.index [:budget_phase_id], name: "index_budget_phase_translations_on_budget_phase_id", using: :btree
      t.index [:locale], name: "index_budget_phase_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :budget_phase_translations
  end

end
