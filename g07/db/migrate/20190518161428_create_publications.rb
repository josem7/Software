class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.string :titulo
      t.integer :aid
      t.string :autor
      t.integer :cid
      t.string :curso
      t.text :contenido
      t.string :descripcion
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
