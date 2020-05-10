class RemoveSalaFromSalaOcupadas < ActiveRecord::Migration[5.1]
  def change
    remove_column :sala_ocupadas, :sala, :string
  end
end
