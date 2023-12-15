class AddHashbodyToCombinations < ActiveRecord::Migration[6.1]
  def change
    add_column :combinations, :hashbody, :text
  end
end
