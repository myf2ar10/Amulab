class AddImagesToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :images, :json
  end
  
  
  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end
  
end
