class AddColumnsToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :total, :float, null: false, default: 0
    add_column :categories, :incomes, :float, null: false, default: 0
    add_column :categories, :expenses, :float, null: false, default: 0
  end
end
