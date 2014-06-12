class AddCitiesReferenceToUsers < ActiveRecord::Migration
  def change
    remove_column :cities, :user_id
    add_column :users, :city_id, :integer
  end
end
