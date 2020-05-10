class CreateFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :favourites do |t|
      t.integer :pid
      t.integer :uid

      t.timestamps
    end
  end
end
