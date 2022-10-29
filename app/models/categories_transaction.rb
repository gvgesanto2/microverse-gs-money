class CategoriesTransaction < ApplicationRecord
  belongs_to :category
  belongs_to :money_transaction

  after_save :increment_category_totals
  after_destroy :decrement_category_totals


  private

  def increment_category_totals
    category.total += money_transaction.price

    if money_transaction.its_type == "income"
      category.incomes += money_transaction.price 
    else
      category.expenses += money_transaction.price
    end
  end

  def decrement_category_totals
    category.total -= money_transaction.price

    if money_transaction.its_type == "income"
      category.incomes -= money_transaction.price 
    else
      category.expenses -= money_transaction.price
    end
  end
end