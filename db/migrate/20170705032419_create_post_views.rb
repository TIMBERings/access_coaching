class CreatePostViews < ActiveRecord::Migration
  def change
    create_table :post_views, id: false do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.datetime :last_accessed, null: false
      t.integer :occurrences, null: false, default: 0

      t.timestamps null: false
    end
  end
end
