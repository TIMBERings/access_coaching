class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, index: true
      t.text :content, null: false
      t.references :author, index: true, references: :user, null: false

      t.timestamps
    end
  end
end
