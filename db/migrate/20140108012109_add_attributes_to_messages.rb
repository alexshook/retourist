class AddAttributesToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :subject, :string
    add_column :messages, :message_content, :string
  end
end
