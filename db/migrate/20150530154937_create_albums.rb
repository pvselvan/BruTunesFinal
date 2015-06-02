class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :year
      t.references :artist, index: true, foreign_key: true
      t.string :cover_photo

      t.timestamps null: false
    end
  end
end
