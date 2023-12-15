class AddKindToCombination < ActiveRecord::Migration[6.1]
  def change
    add_column :combinations, :kind, :string
  end
end
