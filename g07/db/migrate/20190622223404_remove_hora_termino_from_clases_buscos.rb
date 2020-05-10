class RemoveHoraTerminoFromClasesBuscos < ActiveRecord::Migration[5.1]
  def change
    remove_column :clases_buscos, :hora_termino, :time
  end
end
