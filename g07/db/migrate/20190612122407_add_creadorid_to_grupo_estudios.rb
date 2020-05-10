class AddCreadoridToGrupoEstudios < ActiveRecord::Migration[5.1]
  def change
    add_column :grupo_estudios, :creador_id, :integer
  end
end
