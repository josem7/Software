class AddCampusIdToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :campu_id, :integer
  end
end
