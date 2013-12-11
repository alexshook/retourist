class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :story
      t.integer :rating
      t.integer :visitors

      t.timestamps
    end
  end
end
