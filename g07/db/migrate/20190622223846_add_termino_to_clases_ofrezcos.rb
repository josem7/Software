class AddTerminoToClasesOfrezcos < ActiveRecord::Migration[5.1]
  def change
    add_column :clases_ofrezcos, :termino, :datetime
  end
end
