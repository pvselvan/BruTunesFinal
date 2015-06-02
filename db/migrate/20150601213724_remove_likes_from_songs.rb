class RemoveLikesFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :likes, :integer
  end
end
