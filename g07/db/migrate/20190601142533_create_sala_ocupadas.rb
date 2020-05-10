class CreateSalaOcupadas < ActiveRecord::Migration[5.1]
  def change
    create_table :sala_ocupadas do |t|
      t.string :sala
      t.string :evento
      t.time :hora_termino

      t.timestamps
    end
  end
end
