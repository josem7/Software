class AddRoomIdToGrupoEstudios < ActiveRecord::Migration[5.1]
  def change
    add_column :grupo_estudios, :room_id, :integer
  end
end
