class CreateSportsUsers < ActiveRecord::Migration
  def change
    create_table :sports_users, id: false do |t|
      t.integer :sport_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :sports_users, :sport_id
    add_index :sports_users, :user_id
  end
end
