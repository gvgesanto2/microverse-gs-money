class CategoriesTransaction < ApplicationRecord
  belongs_to :category
  belongs_to :money_transaction
end