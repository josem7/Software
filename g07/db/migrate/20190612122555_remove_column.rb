class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :grupo_estudios, :fecha_creacion
    remove_column :grupo_estudios, :hora_termino
  end
end
