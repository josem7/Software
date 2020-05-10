class AddValidacionToGrupoEstudios < ActiveRecord::Migration[5.1]
  def change
    add_column :grupo_estudios, :validacion, :boolean, :default => true
  end
end
