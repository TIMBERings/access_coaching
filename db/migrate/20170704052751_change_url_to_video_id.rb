class ChangeUrlToVideoId < ActiveRecord::Migration
  def change
    rename_column :videos, :url, :serial
  end
end
