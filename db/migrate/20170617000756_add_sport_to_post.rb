class AddSportToPost < ActiveRecord::Migration
  def change
    add_column :posts, :sport_id, :integer
    add_index :posts, :sport_id
  end
end
