class AddTipoToJoinCursos < ActiveRecord::Migration[5.1]
  def change
    add_column :join_cursos, :tipo, :string
  end
end
