class CreateJoinEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :join_events do |t|
      t.integer :uid
      t.integer :eid

      t.timestamps
    end
  end
end
