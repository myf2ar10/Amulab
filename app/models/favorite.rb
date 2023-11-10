class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :item

  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end

  # 特定のユーザーが特定のアイテムにいいねをしているかどうかを判定するメソッド
  def favorite?(user, item)
    self.user == user && self.item == item
  end
end