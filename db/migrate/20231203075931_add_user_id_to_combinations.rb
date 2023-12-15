class AddUserIdToCombinations < ActiveRecord::Migration[6.1]
  def change
    add_column :combinations, :user_id, :integer
  end
end
