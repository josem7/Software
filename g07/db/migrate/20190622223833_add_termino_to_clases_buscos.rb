class AddTerminoToClasesBuscos < ActiveRecord::Migration[5.1]
  def change
    add_column :clases_buscos, :termino, :datetime
  end
end
