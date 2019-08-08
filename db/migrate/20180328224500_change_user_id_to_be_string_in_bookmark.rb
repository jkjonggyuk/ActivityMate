class ChangeUserIdToBeStringInBookmark < ActiveRecord::Migration[5.1]
  def change
  	change_column :bookmarks, :user_id, :string
  end
end
