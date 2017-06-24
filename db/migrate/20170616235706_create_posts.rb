class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.boolean :is_public, default: false
      t.references :author, index: true, references: :user, null: false

      t.timestamps
    end
  end
end
