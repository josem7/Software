class RemoveHoraTerminoFromClasesOfrezcos < ActiveRecord::Migration[5.1]
  def change
    remove_column :clases_ofrezcos, :hora_termino, :time
  end
end
