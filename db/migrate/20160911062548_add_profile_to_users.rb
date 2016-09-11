class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :String
  end
end
