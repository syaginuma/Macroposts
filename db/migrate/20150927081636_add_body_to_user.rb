class AddBodyToUser < ActiveRecord::Migration
  def change
    add_column :users, :body, :integer
  end
end
