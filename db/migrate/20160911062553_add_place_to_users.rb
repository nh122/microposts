class AddPlaceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :place, :String
  end
end