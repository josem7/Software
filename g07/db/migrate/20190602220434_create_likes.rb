class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :uid
      t.integer :type
      t.integer :pid

      t.timestamps
    end
  end
end
