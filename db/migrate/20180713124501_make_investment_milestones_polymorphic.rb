class MakeInvestmentMilestonesPolymorphic < ActiveRecord::Migration[4.2]
  def change
    create_table :milestones do |t|
      t.references :milestoneable, polymorphic: true
      t.string   "title", limit: 80
      t.text     "description"
      t.datetime "publication_date"

      t.references :status, index: true

      t.timestamps null: false
    end

    reversible do |change|
      change.up do
        create_table :milestone_translations do |t|
          t.string   :title
          t.text     :description

          t.integer  :milestone_id, null: false
          t.string   :locale,       null: false

          t.timestamps null: false

          t.index [:milestone_id], name: "index_milestone_translations_on_milestone_id", using: :btree
          t.index [:locale], name: "index_milestone_translations_on_locale", using: :btree
        end
      end

      change.down do
        drop_table :milestone_translations
      end
    end
  end
end
