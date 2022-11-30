class MoneyTransaction < ApplicationRecord
  belongs_to :user
  has_many :categories_transactions, dependent: :destroy
  has_many :categories, through: :categories_transactions

  enum its_type: %i[expense income]

  after_initialize :set_default_type, if: :new_record?

  validates :name, :price, presence: true
  validates :price, numericality: { only_float: true }

  private

  def set_default_type
    self.its_type ||= :expense
  end
end
