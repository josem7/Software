class AddValidacionToCursos < ActiveRecord::Migration[5.1]
  def change
    add_column :cursos, :validacion, :boolean, :default => true
  end
end
