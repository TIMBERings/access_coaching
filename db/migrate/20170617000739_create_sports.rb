class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.text :name

      t.timestamps
    end
    add_index :sports, :name, unique: true

  end
end
