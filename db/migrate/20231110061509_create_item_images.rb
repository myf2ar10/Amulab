class CreateItemImages < ActiveRecord::Migration[6.1]
  def change
    create_table :item_images do |t|

      t.timestamps
    end
  end
end
