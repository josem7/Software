class AddUsrIdRoomIdToEventos < ActiveRecord::Migration[5.1]
  def change
    add_column :eventos, :room_id, :integer
    add_column :eventos, :user_id, :integer
  end
end
