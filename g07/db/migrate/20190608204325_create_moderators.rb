class CreateModerators < ActiveRecord::Migration[5.1]
  def change
    create_table :moderators do |t|
      t.integer :uid
      t.integer :cid
      t.integer :estado

      t.timestamps
    end
  end
end
