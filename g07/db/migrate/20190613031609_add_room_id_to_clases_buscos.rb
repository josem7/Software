class AddRoomIdToClasesBuscos < ActiveRecord::Migration[5.1]
  def change
    add_column :clases_buscos, :room_id, :integer
  end
end
