class AddUrlToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :url, :string, null: false
  end
end
