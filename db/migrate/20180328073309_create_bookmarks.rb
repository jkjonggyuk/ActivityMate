class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.string :place_id
      t.integer :user_id

      t.timestamps
    end
  end
end
