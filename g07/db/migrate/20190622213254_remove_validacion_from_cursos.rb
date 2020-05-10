class RemoveValidacionFromCursos < ActiveRecord::Migration[5.1]
  def change
    remove_column :cursos, :validacion, :boolean
  end
end
