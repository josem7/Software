class CreateCursos < ActiveRecord::Migration[5.1]
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.string :sigla

      t.timestamps
    end
  end
end
