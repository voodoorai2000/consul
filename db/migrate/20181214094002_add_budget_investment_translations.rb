class AddBudgetInvestmentTranslations < ActiveRecord::Migration
  def self.up
    Budget::Investment.create_translation_table!(
      {
        title:               :string,
        description:         :text
      },
      { migrate_data: true }
    )
  end

  def self.down
    Budget::Investment.drop_translation_table!
  end
end
