class AddInicioToSalaOcupadas < ActiveRecord::Migration[5.1]
  def change
    add_column :sala_ocupadas, :inicio, :datetime
  end
end
