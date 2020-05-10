class AddValidacionToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :validacion, :boolean, :default => true
  end
end
