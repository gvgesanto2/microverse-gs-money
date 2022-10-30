class CategoriesTransaction < ApplicationRecord
  belongs_to :category
  belongs_to :money_transaction

  after_save :increment_category_totals
  after_destroy :decrement_category_totals


  private

  def increment_category_totals
    money_transaction = MoneyTransaction.find(self.money_transaction_id)
    category = Category.find(self.category_id)

    if money_transaction.its_type == "income"
      category.incomes += money_transaction.price 
      category.total += money_transaction.price
    else
      category.expenses += money_transaction.price
      category.total -= money_transaction.price
    end

    category.save
  end

  def decrement_category_totals
    money_transaction = MoneyTransaction.find(self.money_transaction_id)
    category = Category.find(self.category_id)

    if money_transaction.its_type == "income"
      category.incomes -= money_transaction.price 
      category.total -= money_transaction.price
    else
      category.expenses -= money_transaction.price
      category.total += money_transaction.price
    end

    category.save
  end
end