class CreateJoinGrupoEstudios < ActiveRecord::Migration[5.1]
  def change
    create_table :join_grupo_estudios do |t|
      t.integer :uid
      t.integer :eid

      t.timestamps
    end
  end
end
