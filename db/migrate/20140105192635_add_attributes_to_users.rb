class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :location, :string
    add_column :users, :job_title, :string
    add_column :users, :employer, :string
    add_column :users, :employer_description, :string
  end
end
