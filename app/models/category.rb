class Category < ApplicationRecord
  belongs_to :user
  has_many :categories_transactions, dependent: :destroy
  has_many :money_transactions, through: :categories_transactions
  has_one_attached :image

  validate :image_type
  validates :name, presence: true

  private

  def image_type
    return unless image.attached?

    image_types = %w[
      image/png image/jpeg image/jpg image/webp
    ]

    return if image.content_type.in?(image_types)

    errors.add(:image,
               'Error: Please upload an image with one of the following extensions: jpeg, jpg, png, or webp!')
  end
end
