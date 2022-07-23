class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :text
      t.timestamps
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0

      t.references :author, null: false, foreign_key: { to_table: 'users' }
    end
  end
end
