class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :location
      t.string :job_title
      t.string :employer
      t.string :employer_description

      t.timestamps
    end
  end
end
