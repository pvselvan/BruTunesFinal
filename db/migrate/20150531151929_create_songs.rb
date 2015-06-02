class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :time
      t.integer :likes
      t.references :album, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
