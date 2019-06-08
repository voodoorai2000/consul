class CreateProgressBars < ActiveRecord::Migration[4.2]
  def change
    create_table :progress_bars do |t|
      t.integer :kind
      t.integer :percentage
      t.references :progressable, polymorphic: true

      t.timestamps null: false
    end

    reversible do |change|
      create_table :progress_bar_translations, force: :cascade do |t|
        t.string   :title

        t.integer  :progress_bar_id, null: false
        t.string   :locale,          null: false

        t.timestamps null: false

        t.index [:progress_bar_id], name: "index_progress_bar_translations_on_progress_bar_id", using: :btree
        t.index [:locale], name: "index_progress_bar_translations_on_locale", using: :btree
      end

      change.down do
        drop_table :progress_bar_translations
      end
    end
  end
end
