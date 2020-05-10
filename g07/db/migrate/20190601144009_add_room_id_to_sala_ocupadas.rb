class AddRoomIdToSalaOcupadas < ActiveRecord::Migration[5.1]
  def change
    add_column :sala_ocupadas, :room_id, :integer
  end
end
