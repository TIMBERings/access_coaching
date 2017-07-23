class CreatePostViews < ActiveRecord::Migration
  def change
    create_table :post_views do |t|
      t.integer :user_id, null: false, index: true
      t.integer :post_id, null: false, index: true
      t.datetime :last_accessed_at, null: false
      t.integer :occurrences, null: false, default: 0

      t.timestamps null: false
    end
  end
end
