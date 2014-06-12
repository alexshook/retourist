class DeleteJoinTableCitiesUsers < ActiveRecord::Migration
  def change
    drop_join_table :users, :cities do |t|
      # t.index [:user_id, :city_id]
      # t.index [:city_id, :user_id]
    end
  end
end
