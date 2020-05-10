class CreateEventos < ActiveRecord::Migration[5.1]
  def change
    create_table :eventos do |t|
      t.timestamp :fecha_creacion
      t.string :tipo

      t.timestamps
    end
  end
end
