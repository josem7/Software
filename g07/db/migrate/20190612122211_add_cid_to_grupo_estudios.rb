class AddCidToGrupoEstudios < ActiveRecord::Migration[5.1]
  def change
    add_column :grupo_estudios, :cid, :integer
  end
end
