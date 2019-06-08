class AddProposalsTranslations < ActiveRecord::Migration
  def self.up
    create_table :proposal_translations, force: :cascade do |t|
      t.string   :title
      t.text     :description
      t.string   :question
      t.text     :summary
      t.text     :retired_explanation

      t.integer  :proposal_id,         null: false
      t.string   :locale,              null: false

      t.timestamps null: false

      t.index [:proposal_id], name: "index_proposal_translations_on_proposal_id", using: :btree
      t.index [:locale], name: "index_proposal_translations_on_locale", using: :btree
    end
  end

  def self.down
    drop_table :proposal_translations
  end
end
