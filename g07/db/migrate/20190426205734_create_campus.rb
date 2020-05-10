class CreateCampus < ActiveRecord::Migration[5.1]
  def change
    create_table :campus do |t|
      t.string :nombre
      t.text :ubicacion
      t.text :mapa

      t.timestamps
    end
  end
end
