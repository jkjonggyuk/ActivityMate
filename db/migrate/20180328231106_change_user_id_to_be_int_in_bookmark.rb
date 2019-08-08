class ChangeUserIdToBeIntInBookmark < ActiveRecord::Migration[5.1]
  def change
  	change_column :bookmarks, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
