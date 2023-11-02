class Item < ApplicationRecord

  has_many_attached :image
  validate :validate_image_count

  private

  def validate_image_count
    if images.attached? && images.count > 5
      errors.add(:images, "5枚まで添付することができます。")
    end
  end

end
