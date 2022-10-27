class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  
  validate :image_type

  private

  def image_type
    return unless photo.attached?

    image_types = %w[
      image/png image/jpeg image/jpg image/webp
    ]

    return if photo.content_type.in?(image_types)

    errors.add(:photo,
               'Error: Please upload an image with one of the following extensions: jpeg, jpg, png, or webp!')
  end
end
