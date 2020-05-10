class AddInicioToClasesBuscos < ActiveRecord::Migration[5.1]
  def change
    add_column :clases_buscos, :inicio, :datetime
  end
end
