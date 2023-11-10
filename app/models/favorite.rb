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


  def favorite?(user)
    self.user == user
  end

end
