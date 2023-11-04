class Item < ApplicationRecord

  has_many_attached :image
  validate :validate_image_count

  belongs_to :genre

  def get_image(*size)
    unless image.attached?
      file_path = Rails.root.join('/app/assets/images/no_image_GRN.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image_GRN.jpg', content_type: 'no_image_GRN.jpg')
    end

    if !size.empty?
      image.variant(resize: size)
    else
      image
    end
  end

  private

  def validate_image_count
    if image.attached? && image.count > 5
      errors.add(:image, "5枚まで添付することができます。")
    end
  end

end
