class CreateJoinCursos < ActiveRecord::Migration[5.1]
  def change
    create_table :join_cursos do |t|
      t.integer :uid
      t.integer :cid

      t.timestamps
    end
  end
end
