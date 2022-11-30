class CreateMoneyTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :money_transactions do |t|
      t.string :name, null: false
      t.float :price, null: false, default: 0
      t.integer :type, null: false, default: 0

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
