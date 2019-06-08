class AddHomePageToLegislationProcesses < ActiveRecord::Migration[4.2]
  def change
    add_column :legislation_processes, :homepage_enabled, :boolean, default: false

    reversible do |dir|
      dir.up do
        add_column :legislation_process_translations, :homepage, :text, default: false
      end

      dir.down do
        remove_column :legislation_process_translations, :homepage
      end
    end
  end
end
