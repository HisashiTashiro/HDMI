class CreateCombinations < ActiveRecord::Migration[6.1]
  def change
    create_table :combinations do |t|
      t.text :about

      t.timestamps
    end
  end
end
