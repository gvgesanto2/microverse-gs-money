class MoneyTransaction < ApplicationRecord
  belongs_to :user
  has_many :categories_transactions, dependent: :destroy
  has_many :categories, through: :categories_transactions

  enum type: %i[expense income]

  after_initialize :set_default_type, if: :new_record?

  validates :name, :price, presence: true
  validates :price, numericality: { only_float: true, greater_than_or_equal_to: 0 }

  private

  def set_default_type
    self.type ||= :expense
  end 
end
