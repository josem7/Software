class CreateClasesBuscos < ActiveRecord::Migration[5.1]
  def change
    create_table :clases_buscos do |t|
      t.string :curso
      t.time :hora_termino

      t.timestamps
    end
  end
end
