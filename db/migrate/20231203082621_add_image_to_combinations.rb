class AddImageToCombinations < ActiveRecord::Migration[6.1]
  def change
    add_column :combinations, :image, :string
  end
end
