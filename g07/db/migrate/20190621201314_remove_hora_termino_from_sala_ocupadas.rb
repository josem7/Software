class RemoveHoraTerminoFromSalaOcupadas < ActiveRecord::Migration[5.1]
  def change
    remove_column :sala_ocupadas, :hora_termino, :string
  end
end
