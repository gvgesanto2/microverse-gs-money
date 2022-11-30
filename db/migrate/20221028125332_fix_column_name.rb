class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :money_transactions, :type, :its_type
  end
end
