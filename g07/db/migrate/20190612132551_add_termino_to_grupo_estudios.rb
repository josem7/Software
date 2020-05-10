class AddTerminoToGrupoEstudios < ActiveRecord::Migration[5.1]
  def change
    add_column :grupo_estudios, :termino, :datetime
  end
end
