class Users < ActiveRecord::Migration[5.1]
  def change
change_table :users do |t|
	t.string :password
	end
  end
end
