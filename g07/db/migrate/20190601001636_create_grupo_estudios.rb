class CreateGrupoEstudios < ActiveRecord::Migration[5.1]
  def change
    create_table :grupo_estudios do |t|
      t.string :curso
      t.integer :capacidad
      t.time :hora_termino
      t.datetime :fecha_creacion

      t.timestamps
    end
  end
end
