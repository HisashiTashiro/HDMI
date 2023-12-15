class CreateHashtagPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtag_posts do |t|
      t.references :combination, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
