class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :nombre
      t.text :ubicacion
      t.float :ptje_disponibilidad
      t.float :ptje_enchufes
      t.float :ptje_ruido

      t.timestamps
    end
  end
end
