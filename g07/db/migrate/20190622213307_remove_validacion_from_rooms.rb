class RemoveValidacionFromRooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :rooms, :validacion, :boolean
  end
end
