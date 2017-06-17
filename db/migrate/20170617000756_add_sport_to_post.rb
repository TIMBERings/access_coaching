class AddSportToPost < ActiveRecord::Migration
  def up
    add_column :posts, :sport_id, :integer
  end

  def down
    remove_column :posts, :sport_id
  end
end
