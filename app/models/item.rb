class Item < ApplicationRecord

  has_many_attached :images
  validate :validate_image_count

  belongs_to :genre
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :item_comments, dependent: :destroy

  has_many :tags, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  def get_image(*size)
    unless images.attached?
      file_path = Rails.root.join('/app/assets/images/no_image.png')
      images.attach(io: File.open(file_path), filename: 'no_image_GRN.png', content_type: 'no_image.png')
    end

    if !size.empty?
      images.variant(resize: size)
    else
      images
    end
  end

  def self.search_for(content)
    # アプリケーションに合わせた実装にするためシンプル化
    # if method == 'perfect'
    #   User.where(name: content)
    # elsif method == 'forward'
    #   User.where('name LIKE ?', content + '%')
    # elsif method == 'backward'
    #   User.where('name LIKE ?', '%' + content)
    # else
      Item.where('name LIKE ?', '%' + content + '%')
    # end
  end

  private

  def validate_image_count
    if images.attached? && images.count > 5
      errors.add(:images, "5枚まで添付することができます。")
    end
  end

end
