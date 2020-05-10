class AddRoomIdToClasesOfrezcos < ActiveRecord::Migration[5.1]
  def change
    add_column :clases_ofrezcos, :room_id, :integer
  end
end
