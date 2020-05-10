class AddInicioToGrupoEstudios < ActiveRecord::Migration[5.1]
  def change
    add_column :grupo_estudios, :inicio, :datetime
  end
end
