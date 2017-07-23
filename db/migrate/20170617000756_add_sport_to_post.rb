class AddSportToPost < ActiveRecord::Migration
  def change
    add_column :posts, :sport_id, :integer, index: true
  end
end
