class CreateClasesOfrezcos < ActiveRecord::Migration[5.1]
  def change
    create_table :clases_ofrezcos do |t|
      t.integer :uid
      t.integer :precio
      t.time :hora_termino

      t.timestamps
    end
  end
end
