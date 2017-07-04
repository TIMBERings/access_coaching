class AddTitleToPost < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string, null: false, default: Faker::HarryPotter.quote
  end
end
