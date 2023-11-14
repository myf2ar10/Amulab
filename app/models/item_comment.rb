class ItemComment < ApplicationRecord

  belongs_to :user
  belongs_to :item

  validates :comment, length: { maximum: 200 }

end