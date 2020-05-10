class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :pid
      t.integer :uid
      t.string :autor
      t.text :contenido

      t.timestamps
    end
  end
end
