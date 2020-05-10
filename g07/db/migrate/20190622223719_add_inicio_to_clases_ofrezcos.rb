class AddInicioToClasesOfrezcos < ActiveRecord::Migration[5.1]
  def change
    add_column :clases_ofrezcos, :inicio, :datetime
  end
end
