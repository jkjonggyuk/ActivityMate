class AddPasswordHash < ActiveRecord::Migration[5.1]
  def change

    change_table :users do |t|
	t.string :password_hash
    end
  end
end
