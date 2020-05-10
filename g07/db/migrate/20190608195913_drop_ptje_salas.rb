class DropPtjeSalas < ActiveRecord::Migration[5.1]
  def change
    remove_column :rooms, :ptje_disponibilidad
    remove_column :rooms, :ptje_enchufes
    remove_column :rooms, :ptje_ruido
  end
end
