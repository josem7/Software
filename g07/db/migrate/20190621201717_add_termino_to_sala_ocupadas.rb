class AddTerminoToSalaOcupadas < ActiveRecord::Migration[5.1]
  def change
    add_column :sala_ocupadas, :termino, :datetime
  end
end
